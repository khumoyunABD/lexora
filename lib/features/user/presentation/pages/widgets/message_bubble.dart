import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lexora/core/constants/app_colors.dart';
import 'package:lexora/core/constants/app_text_styles.dart';
import 'package:lexora/features/session/domain/entities/message_entity.dart';
import 'package:lexora/features/session/domain/entities/source_entity.dart';
import 'package:lexora/features/user/presentation/pages/message_text.dart';
import 'package:lexora/features/user/presentation/pages/tts_helper.dart';
import 'package:lexora/features/user/presentation/pages/widgets/sources_bottom_sheet.dart';

class MessageBubble extends StatefulWidget {
  final MessageEntity message;
  final int index;
  final List<SourceItemEntity>? sources;
  final TTSHelper ttsHelper;
  final int? playingMessageIndex;
  final Function(int?) onPlayingChanged;
  final Map<int, bool?> messageFeedback;
  final Map<int, bool> copiedStates;
  final Function(int, bool?) onFeedbackChanged;
  final Function(int, bool) onCopiedChanged;

  const MessageBubble({
    super.key,
    required this.message,
    required this.index,
    this.sources,
    required this.ttsHelper,
    required this.playingMessageIndex,
    required this.onPlayingChanged,
    required this.messageFeedback,
    required this.copiedStates,
    required this.onFeedbackChanged,
    required this.onCopiedChanged,
  });

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  @override
  Widget build(BuildContext context) {
    final isUser = widget.message.role.contains('user');
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.h),
            padding: EdgeInsets.symmetric(
              horizontal: isUser ? 12.w : 0,
              vertical: 12.h,
            ),
            constraints: BoxConstraints(
                maxWidth: isUser ? 280.w : 600.w, minWidth: 240.w),
            decoration: BoxDecoration(
              color: isUser ? AppColors.surface : null,
              borderRadius: BorderRadius.circular(16.r).copyWith(
                bottomRight: isUser ? Radius.circular(4.r) : null,
              ),
            ),
            child: MessageText(
              content: widget.message.content,
              style: AppTextStyles.body.copyWith(
                color: isUser ? Colors.white : AppColors.textPrimary,
              ),
            ),
          ),

          // Show action buttons only for assistant messages
          if (!isUser)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // if source isn't empty, then show it
                if (widget.sources != null && widget.sources!.isNotEmpty)
                  _buildSourcesButton(),
                _buildActionButtons(),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildSourcesButton() {
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: Colors.grey,
            width: 0.15,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: () => _showSourcesBottomSheet(widget.sources!),
        child: Text(
          'Sources...',
          style: AppTextStyles.caption,
        ),
      ),
    );
  }

  void _showSourcesBottomSheet(List<SourceItemEntity> sources) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => SourcesBottomSheet(sources: sources),
    );
  }

  Widget _buildActionButtons() {
    final feedback = widget.messageFeedback[widget.index];
    final isPlaying = widget.playingMessageIndex == widget.index;
    final isCopied = widget.copiedStates[widget.index] ?? false;

    return Padding(
      padding: EdgeInsets.only(left: 16.w, top: 8.h, bottom: 8.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Copy button - changes to checkmark for 1 second
          _buildActionButton(
            icon: isCopied ? Icons.check : Icons.content_copy,
            onTap: () async {
              await Clipboard.setData(
                  ClipboardData(text: widget.message.content));

              // Show checkmark
              widget.onCopiedChanged(widget.index, true);

              // Reset to copy icon after 1 second
              Timer(const Duration(seconds: 1), () {
                if (mounted) {
                  widget.onCopiedChanged(widget.index, false);
                }
              });
            },
          ),
          SizedBox(width: 8.w),

          // Play/Stop button
          _buildActionButton(
            icon: isPlaying ? Icons.stop : Icons.play_arrow,
            onTap: () async {
              if (isPlaying) {
                await widget.ttsHelper.stop();
                widget.onPlayingChanged(null);
              } else {
                widget.onPlayingChanged(widget.index);
                // Remove markdown links for TTS
                String textToSpeak =
                    _removeMarkdownLinks(widget.message.content);
                await widget.ttsHelper.speakWithAutoLanguage(textToSpeak);
              }
            },
          ),
          SizedBox(width: 8.w),

          // Like button - outlined when inactive, filled when active
          _buildActionButton(
            icon: feedback == true ? Icons.thumb_up : Icons.thumb_up_outlined,
            onTap: () {
              if (widget.messageFeedback[widget.index] == true) {
                widget.onFeedbackChanged(widget.index, null); // Toggle off
              } else {
                widget.onFeedbackChanged(widget.index, true);
              }
            },
          ),
          SizedBox(width: 8.w),

          // Dislike button - outlined when inactive, filled when active
          _buildActionButton(
            icon: feedback == false
                ? Icons.thumb_down
                : Icons.thumb_down_outlined,
            onTap: () {
              if (widget.messageFeedback[widget.index] == false) {
                widget.onFeedbackChanged(widget.index, null); // Toggle off
              } else {
                widget.onFeedbackChanged(widget.index, false);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32.w,
        height: 32.w,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Icon(
          icon,
          color: Colors.white.withValues(alpha: 0.6),
          size: 16.sp,
        ),
      ),
    );
  }

  String _removeMarkdownLinks(String text) {
    // Remove [text](url) format and keep only the text
    return text.replaceAllMapped(
      RegExp(r'\[([^\]]+)\]\(([^\)]+)\)'),
      (match) => match.group(1) ?? '',
    );
  }
}
