import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lexora/features/session/domain/entities/artifact_entity.dart';
import 'package:lexora/features/session/domain/entities/message_entity.dart';
import 'package:lexora/features/session/domain/entities/source_entity.dart';
import 'package:lexora/features/session/presentation/bloc/session_bloc.dart';
import 'package:lexora/features/session/presentation/bloc/session_details_bloc.dart';
import 'package:lexora/features/session/presentation/bloc/session_details_event.dart';
import 'package:lexora/features/session/presentation/bloc/session_details_state.dart';
import 'package:lexora/features/session/presentation/bloc/session_event.dart';
import 'package:lexora/features/session/presentation/bloc/session_state.dart';
import 'package:lexora/features/user/presentation/pages/side_drawer.dart';
import 'package:lexora/features/user/presentation/pages/tts_helper.dart';
import 'package:lexora/features/user/presentation/pages/widgets/artifacts_bottom_sheet.dart';
import 'package:lexora/features/user/presentation/pages/widgets/chat_input_bar.dart';
import 'package:lexora/features/user/presentation/pages/widgets/chat_top_bar.dart';
import 'package:lexora/features/user/presentation/pages/widgets/message_bubble.dart';

class ChatPage extends StatefulWidget {
  ChatPage({
    super.key,
    this.sessionId,
  });

  String? sessionId;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<MessageEntity> _messages = [];
  List<SourceItemEntity> _sources = [];
  List<ArtifactEntity> _artifacts = [];

  // Store like/dislike states for each message (index-based)
  final Map<int, bool?> _messageFeedback =
      {}; // null = no feedback, true = liked, false = disliked

  // Track copied state for each message
  final Map<int, bool> _copiedStates = {};

  final TTSHelper _ttsHelper = TTSHelper();
  int? _playingMessageIndex;

  @override
  void initState() {
    super.initState();
    _fetchSessionData();
    _initializeTts();
  }

  void _initializeTts() async {
    await _ttsHelper.initialize();

    _ttsHelper.flutterTts.setCompletionHandler(() {
      setState(() {
        _playingMessageIndex = null;
      });
    });
  }

  @override
  void didUpdateWidget(ChatPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.sessionId != widget.sessionId) {
      _messages = [];
      _messageFeedback.clear();
      _copiedStates.clear();
      _fetchSessionData();
    }
  }

  void _fetchSessionData() {
    if (widget.sessionId != null && widget.sessionId!.isNotEmpty) {
      context
          .read<SessionDetailsBloc>()
          .add(SessionDetailsEvent.getMessages(sessionId: widget.sessionId!));
      context
          .read<SessionDetailsBloc>()
          .add(SessionDetailsEvent.getArtifacts(sessionId: widget.sessionId!));
      context
          .read<SessionDetailsBloc>()
          .add(SessionDetailsEvent.getSources(sessionId: widget.sessionId!));
    }
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'artifacts':
        _showArtifactsBottomSheet();
        break;
      case 'bookmark':
        _handleBookmark();
        break;
      case 'new_chat':
        _handleNewChat();
      case 'delete':
        _handleDelete();
        break;
    }
  }

  void _showArtifactsBottomSheet() {
    if (_artifacts.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('No artifacts available'),
          backgroundColor: Colors.grey,
        ),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => ArtifactsBottomSheet(artifacts: _artifacts),
    );
  }

  void _handleBookmark() {
    // TODO: Implement bookmark functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Session bookmarked'),
        backgroundColor: Colors.orange,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _handleNewChat() {
    context.go('/');
  }

  void _handleDelete() {
    if (widget.sessionId == null || widget.sessionId!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No session to delete'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    // Show confirmation dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E1E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Delete Chat',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Are you sure you want to delete this chat? This action cannot be undone.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white70),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Parse sessionId to int and dispatch delete event
              // final sessionIdInt = int.tryParse(widget.sessionId!);
              if (widget.sessionId != null) {
                context.read<SessionBloc>().add(
                      SessionEvent.deleteSession(id: widget.sessionId!),
                    );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Invalid session ID'),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SessionBloc, SessionState>(
      listener: (context, state) {
        state.maybeWhen(
          sessionDeleted: () {
            // Show success message
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Session deleted successfully'),
                backgroundColor: Color(0xFF2D5F3C),
                behavior: SnackBarBehavior.floating,
              ),
            );
            // Navigate to home
            context.go('/');
          },
          error: (failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text(failure.errorMessage ?? 'Failed to delete session'),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.black,
        drawer: const SideDrawer(),
        body: SafeArea(
          child: Column(
            children: [
              ChatTopBar(
                scaffoldKey: _scaffoldKey,
                sessionId: widget.sessionId,
                onMenuAction: _handleMenuAction,
              ),
              Expanded(
                child: BlocConsumer<SessionDetailsBloc, SessionDetailsState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      error: (failure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                failure.errorMessage ?? 'An error occurred'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      },
                      orElse: () {},
                    );
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () {
                        if (_messages.isEmpty) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                        return _buildChatContent();
                      },
                      messagesLoaded: (messagesResponse) {
                        _messages = messagesResponse.messages;
                        if (_messages.isEmpty) {
                          return _buildEmptyChatContent();
                        }
                        return _buildChatContent();
                      },
                      sourcesLoaded: (sourcesResponse) {
                        _sources = sourcesResponse.sources;
                        if (_messages.isEmpty) {
                          return _buildEmptyChatContent();
                        }
                        return _buildChatContent();
                      },
                      artifactsLoaded: (artifactsResponse) {
                        _artifacts = artifactsResponse.artifacts;
                        if (_messages.isEmpty) {
                          return _buildEmptyChatContent();
                        }
                        return _buildChatContent();
                      },
                      orElse: () {
                        if (_messages.isNotEmpty) {
                          return _buildChatContent();
                        }
                        return widget.sessionId == null
                            ? _buildEmptyChatContent()
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              );
                      },
                    );
                  },
                ),
              ),
              ChatInputBar(textController: _textController),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyChatContent() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            'What can I help you \nwith?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildChatContent() {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.all(16.w),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        return MessageBubble(
          message: _messages[index],
          index: index,
          sources: _sources,
          ttsHelper: _ttsHelper,
          playingMessageIndex: _playingMessageIndex,
          onPlayingChanged: (playing) {
            setState(() {
              _playingMessageIndex = playing;
            });
          },
          messageFeedback: _messageFeedback,
          copiedStates: _copiedStates,
          onFeedbackChanged: (index, feedback) {
            setState(() {
              _messageFeedback[index] = feedback;
            });
          },
          onCopiedChanged: (index, copied) {
            setState(() {
              _copiedStates[index] = copied;
            });
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    _ttsHelper.stop();
    super.dispose();
  }
}
