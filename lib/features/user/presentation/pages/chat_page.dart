import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lexora/core/constants/app_colors.dart';
import 'package:lexora/core/constants/app_text_styles.dart';
import 'package:lexora/features/session/domain/entities/message_entity.dart';
import 'package:lexora/features/session/presentation/bloc/session_details_bloc.dart';
import 'package:lexora/features/session/presentation/bloc/session_details_event.dart';
import 'package:lexora/features/session/presentation/bloc/session_details_state.dart';
import 'package:lexora/features/user/presentation/pages/side_drawer.dart';

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

  @override
  void initState() {
    super.initState();
    _fetchSessionData();
  }

  @override
  void didUpdateWidget(ChatPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Fetch new data if sessionId changed
    if (oldWidget.sessionId != widget.sessionId) {
      _messages = []; // Clear old messages
      _fetchSessionData();
    }
  }

  void _fetchSessionData() {
    // Only fetch data if sessionId is not null AND not empty
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      drawer: const SideDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(
              child: BlocConsumer<SessionDetailsBloc, SessionDetailsState>(
                listener: (context, state) {
                  state.maybeWhen(
                    error: (failure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text(failure.errorMessage ?? 'An error occurred'),
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
                      // Show loading only if we don't have messages yet
                      if (_messages.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }
                      // If we already have messages, keep showing them
                      return _buildChatContent();
                    },
                    messagesLoaded: (messagesResponse) {
                      _messages = messagesResponse.messages;
                      if (_messages.isEmpty) {
                        return _buildEmptyChatContent();
                      }
                      return _buildChatContent();
                    },
                    sourcesLoaded: (_) {
                      // Keep showing messages when sources are loaded
                      if (_messages.isEmpty) {
                        return _buildEmptyChatContent();
                      }
                      return _buildChatContent();
                    },
                    artifactsLoaded: (_) {
                      // Keep showing messages when artifacts are loaded
                      if (_messages.isEmpty) {
                        return _buildEmptyChatContent();
                      }
                      return _buildChatContent();
                    },
                    orElse: () {
                      // If we have messages, show them
                      if (_messages.isNotEmpty) {
                        return _buildChatContent();
                      }
                      // Otherwise show appropriate state
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
            _buildBottomInputBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Menu button
          GestureDetector(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(28),
              ),
              child: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),

          // Used sources button
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(28),
            ),
            child: const Icon(
              //cool icon
              // Icons.content_paste_search,

              //current icon
              Icons.more_vert,
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyChatContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            textAlign: TextAlign.center,
            'What can I help you \nwith?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 40),
          // Wrap(
          //   spacing: 12,
          //   runSpacing: 12,
          //   alignment: WrapAlignment.center,
          //   children: [
          //     _buildActionButton(
          //       icon: Icons.image_outlined,
          //       label: 'Create image',
          //       color: const Color(0xFF2D5F3C),
          //     ),
          //     _buildActionButton(
          //       icon: Icons.article_outlined,
          //       label: 'Summarize text',
          //       color: const Color(0xFF6B4423),
          //     ),
          //     _buildActionButton(
          //       icon: Icons.bar_chart,
          //       label: 'Analyze data',
          //       color: const Color(0xFF1E4B5F),
          //     ),
          //     _buildActionButton(
          //       icon: Icons.more_horiz,
          //       label: 'More',
          //       color: const Color(0xFF1E1E1E),
          //     ),
          //   ],
          // ),
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
        return _buildMessageBubble(_messages[index]);
      },
    );
  }

  Widget _buildMessageBubble(MessageEntity message) {
    final isUser = message.role.contains('user');
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        constraints: BoxConstraints(maxWidth: 280.w),
        decoration: BoxDecoration(
          color: isUser ? AppColors.surface : AppColors.background,
          borderRadius: BorderRadius.circular(16.r).copyWith(
            bottomRight: isUser ? Radius.circular(4.r) : null,
            bottomLeft: !isUser ? Radius.circular(4.r) : null,
          ),
        ),
        child: Text(
          message.content,
          style: AppTextStyles.body.copyWith(
            color: isUser ? Colors.white : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white.withValues(alpha: 0.9),
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomInputBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Plus button
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          // Text input field
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                right: 12,
                left: 24,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Ask Lexora',
                        hintStyle: TextStyle(
                          color: Colors.white.withValues(alpha: 0.4),
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
