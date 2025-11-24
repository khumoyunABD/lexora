import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MessageText extends StatelessWidget {
  final String content;
  final TextStyle style;

  const MessageText({
    super.key,
    required this.content,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: style,
        children: _parseMarkdown(content, style),
      ),
    );
  }

  List<TextSpan> _parseMarkdown(String text, TextStyle baseStyle) {
    final List<TextSpan> spans = [];

    // Combined regex to match links, bold, and italic
    // Priority: Links first, then bold, then italic
    final RegExp markdownRegex =
        RegExp(r'\[([^\]]+)\]\(([^\)]+)\)|' // [text](url) - Groups 1 & 2
            r'\*\*(.+?)\*\*|' // **bold** - Group 3
            r'\*(.+?)\*' // *italic* - Group 4
            );

    int lastMatchEnd = 0;

    for (final match in markdownRegex.allMatches(text)) {
      // Add text before the match (plain text)
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(
          text: text.substring(lastMatchEnd, match.start),
          style: baseStyle,
        ));
      }

      // Check which pattern matched and handle accordingly
      if (match.group(1) != null && match.group(2) != null) {
        // This is a link [text](url)
        final linkText = match.group(1)!;
        final url = match.group(2)!;

        spans.add(TextSpan(
          text: linkText,
          style: baseStyle.copyWith(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              final uri = Uri.parse(url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            },
        ));
      } else if (match.group(3) != null) {
        // This is bold **text**
        spans.add(TextSpan(
          text: match.group(3)!,
          style: baseStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ));
      } else if (match.group(4) != null) {
        // This is italic *text*
        spans.add(TextSpan(
          text: match.group(4)!,
          style: baseStyle.copyWith(
            fontStyle: FontStyle.italic,
          ),
        ));
      }

      lastMatchEnd = match.end;
    }

    // Add remaining text after the last match
    if (lastMatchEnd < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastMatchEnd),
        style: baseStyle,
      ));
    }

    return spans;
  }
}
