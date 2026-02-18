import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lexora/features/session/domain/entities/artifact_entity.dart';
import 'package:lexora/features/session/domain/entities/chat_request_entity.dart';
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
import 'package:lexora/utils/helpers/router.dart';

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

  // Message polling
  // late final MessagePollingService _pollingService;
  // StreamSubscription? _pollingSubscription;

  // Track if this is the first load
  // bool _isFirstLoad = true;

  // Track if user is at bottom
  bool _showScrollToBottom = false;

  // Track sending state
  bool _isSendingMessage = false;

  // Store pending message when creating a new session
  String? _pendingMessage;

  @override
  void initState() {
    super.initState();
    // _pollingService = MessagePollingService(di<SessionDatasource>());
    _fetchSessionData();
    // _startPolling();
    _initializeTts();
    _setupScrollListener();
  }

  void _setupScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        final isAtBottom = _scrollController.offset >=
            _scrollController.position.maxScrollExtent - 100;

        if (isAtBottom != !_showScrollToBottom) {
          setState(() {
            _showScrollToBottom = !isAtBottom;
          });
        }
      }
    });
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
      // If we're creating a new session with a pending message,
      // preserve the optimistic UI - don't clear messages or fetch data
      if (_pendingMessage != null &&
          widget.sessionId != null &&
          widget.sessionId!.isNotEmpty) {
        // We're in the middle of creating a session with a message
        // The pending message will be sent via _sendPendingMessage
        // Don't interfere with the optimistic UI
        return;
      }

      // Reset local state
      setState(() {
        _messages = [];
        _sources = [];
        _artifacts = [];
        _messageFeedback.clear();
        _copiedStates.clear();
      });

      // If navigating to new chat (no sessionId), reset the bloc
      if (widget.sessionId == null || widget.sessionId!.isEmpty) {
        context.read<SessionDetailsBloc>().add(
              const SessionDetailsEvent.reset(),
            );
      } else {
        // Otherwise fetch the new session's data
        _fetchSessionData();
      }
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

  // void _startPolling() {
  //   if (widget.sessionId != null && widget.sessionId!.isNotEmpty) {
  //     _pollingSubscription?.cancel();

  //     // Start polling with 5 second interval
  //     final stream = _pollingService.startPolling(
  //       widget.sessionId!,
  //       interval: const Duration(seconds: 5),
  //     );

  //     _pollingSubscription = stream.listen((messageResponse) {
  //       // Update messages when new data arrives
  //       if (mounted) {
  //         final newMessages =
  //             messageResponse.messages.map((m) => m.toEntity()).toList();

  //         setState(() {
  //           _messages = newMessages;
  //         });

  //         // No auto-scrolling during polling - user controls scrolling manually
  //       }
  //     });
  //   }
  // }

  void _scrollToBottom({bool animate = true}) {
    // Wait for the UI to render the new messages
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        if (animate) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        } else {
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        }
      }
    });
  }

  // void _stopPolling() {
  //   _pollingSubscription?.cancel();
  //   _pollingService.stopPolling();
  // }

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
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
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
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Session bookmarked'),
        backgroundColor: Colors.orange,
      ),
    );
  }

  void _handleNewChat() {
    context.go('/');
  }

  void _handleDelete() {
    if (widget.sessionId == null || widget.sessionId!.isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No session to delete'),
          backgroundColor: Colors.red,
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
                context.go(PagePath.home);
              } else {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Invalid session ID'),
                    backgroundColor: Colors.red,
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

  void _handleSendMessage() {
    final message = _textController.text.trim();
    if (message.isEmpty || _isSendingMessage) return;

    // If no session exists, create a new one first
    if (widget.sessionId == null || widget.sessionId!.isEmpty) {
      setState(() {
        _pendingMessage = message;
        _isSendingMessage = true;
        // Add optimistic user message to UI immediately
        _messages = [
          MessageEntity(
            role: 'user',
            content: message,
            artifacts: const [],
          ),
        ];
      });
      _textController.clear();

      // Scroll to bottom to show the new message
      _scrollToBottom(animate: true);

      context.read<SessionBloc>().add(
            SessionEvent.createSession(
              agentType: 'research',
              name: message.length > 50
                  ? '${message.substring(0, 50)}...'
                  : message,
            ),
          );
      return;
    }

    // Add optimistic user message to UI
    setState(() {
      _isSendingMessage = true;
      _messages = [
        ..._messages,
        MessageEntity(
          role: 'user',
          content: message,
          artifacts: const [],
        ),
      ];
    });

    // Scroll to bottom to show the new message
    _scrollToBottom(animate: true);

    // Clear the input field
    _textController.clear();

    // Send the chat message via BLoC
    final request = ChatRequestEntity(
      messages: [
        ChatRequestMessageEntity(
          role: 'user',
          content: message,
        ),
      ],
    );

    context.read<SessionDetailsBloc>().add(
          SessionDetailsEvent.sendChat(
            sessionId: widget.sessionId!,
            request: request,
          ),
        );
  }

  void _sendPendingMessage(String sessionId) {
    if (_pendingMessage == null) return;

    final message = _pendingMessage!;
    _pendingMessage = null;

    // User message is already in the _messages list from _handleSendMessage
    // Just send the chat message via BLoC
    final request = ChatRequestEntity(
      messages: [
        ChatRequestMessageEntity(
          role: 'user',
          content: message,
        ),
      ],
    );

    context.read<SessionDetailsBloc>().add(
          SessionDetailsEvent.sendChat(
            sessionId: sessionId,
            request: request,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SessionBloc, SessionState>(
      listener: (context, state) {
        state.maybeWhen(
          sessionCreated: (session) {
            final sessionId = session.id.toString();

            // DON'T navigate - just update sessionId in place
            // This prevents widget recreation and preserves optimistic UI
            widget.sessionId = sessionId;

            // Send the pending message if exists
            if (_pendingMessage != null) {
              _sendPendingMessage(sessionId);
            }
          },
          sessionDeleted: () {
            // Show success message
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Session deleted successfully'),
                backgroundColor: Color(0xFF2D5F3C),
              ),
            );
            // Navigate to home
            context.go('/');
          },
          error: (failure) {
            setState(() {
              _isSendingMessage = false;
              _pendingMessage = null;
            });
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text(failure.errorMessage ?? 'Failed to delete session'),
                backgroundColor: Colors.red,
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
                        setState(() {
                          _isSendingMessage = false;
                        });

                        /// we disabled showing errors for now, but need to enable it later

                        // ScaffoldMessenger.of(context).clearSnackBars();
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(
                        //     content: Text(
                        //         failure.errorMessage ?? 'An error occurred'),
                        //     backgroundColor: Colors.red,
                        //   ),
                        // );
                      },
                      chatSent: (response) {
                        // Don't set _isSendingMessage = false here
                        // Wait for messagesLoaded with actual messages
                      },
                      messagesLoaded: (messagesResponse) {
                        setState(() {
                          // Preserve optimistic UI while waiting for chat response
                          if (_isSendingMessage &&
                              messagesResponse.messages.isEmpty) {
                            return;
                          }

                          _messages = messagesResponse.messages;
                          _isSendingMessage = false;
                        });

                        // Update URL silently after we have real messages (without rebuilding widget)
                        if (messagesResponse.messages.isNotEmpty &&
                            widget.sessionId != null) {
                          final currentUri =
                              GoRouterState.of(context).uri.toString();
                          final expectedUri = '/?id=${widget.sessionId}';

                          // Only update URL if it doesn't match (to avoid loops)
                          if (currentUri != expectedUri) {
                            context.replace(expectedUri);
                          }
                        }

                        if (messagesResponse.messages.isNotEmpty) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            _scrollToBottom(animate: true);
                          });
                        }
                      },
                      sourcesLoaded: (sourcesResponse) {
                        setState(() {
                          _sources = sourcesResponse.sources;
                        });
                      },
                      artifactsLoaded: (artifactsResponse) {
                        setState(() {
                          _artifacts = artifactsResponse.artifacts;
                        });
                      },
                      orElse: () {},
                    );
                  },
                  builder: (context, state) {
                    // PRIORITY: Always show chat content if we have messages or are sending
                    if (_messages.isNotEmpty || _isSendingMessage) {
                      return _buildChatContent();
                    }

                    // Then check bloc state
                    return state.maybeWhen(
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        );
                      },
                      initial: () => _buildEmptyChatContent(),
                      messagesLoaded: (_) => _buildEmptyChatContent(),
                      sourcesLoaded: (_) => _buildEmptyChatContent(),
                      artifactsLoaded: (_) => _buildEmptyChatContent(),
                      orElse: () {
                        return widget.sessionId == null
                            ? _buildEmptyChatContent()
                            : const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.white),
                              );
                      },
                    );
                  },
                ),
              ),
              ChatInputBar(
                textController: _textController,
                onSend: _handleSendMessage,
                isLoading: _isSendingMessage,
              ),
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
    return Stack(
      children: [
        ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.all(16.w),
          itemCount: _messages.length + (_isSendingMessage ? 1 : 0),
          itemBuilder: (context, index) {
            // Show loading indicator as last item when sending
            if (index == _messages.length && _isSendingMessage) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.auto_awesome,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E1E1E),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white.withValues(alpha: 0.6)),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              'Thinking...',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.6),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

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
        ),
        // Floating scroll to bottom button
        if (_showScrollToBottom)
          Align(
            alignment: Alignment.bottomCenter,
            // bottom: 20.h,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: const Color(0xFF1E1E1E),
              onPressed: () => _scrollToBottom(),
              child: const Icon(
                Icons.arrow_downward,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    // _stopPolling();
    _textController.dispose();
    _scrollController.dispose();
    _ttsHelper.stop();
    super.dispose();
  }
}
