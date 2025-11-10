import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class HighlightedText extends StatelessWidget {
  final String message;
  final List<String> highlights; // words/phrases to highlight

  const HighlightedText({
    super.key,
    required this.message,
    required this.highlights,
  });

  @override
  Widget build(BuildContext context) {
    final spans = _buildHighlightedText(context, message, highlights);

    return Text.rich(
      TextSpan(children: spans),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  List<TextSpan> _buildHighlightedText(
    BuildContext context,
    String text,
    List<String> highlights,
  ) {
    final spans = <TextSpan>[];
    String remaining = text;

    while (remaining.isNotEmpty) {
      // Find the first occurrence of any highlight
      int closestIndex = remaining.length;
      String? foundWord;

      for (final word in highlights) {
        final index = remaining.indexOf(word);
        if (index != -1 && index < closestIndex) {
          closestIndex = index;
          foundWord = word;
        }
      }

      if (foundWord == null) {
        // No highlight left, add the rest as normal text
        spans.add(
          TextSpan(
            text: remaining,
            style: TextStyle(
              color: DefaultColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
        break;
      }

      // Add text before the highlight
      if (closestIndex > 0) {
        spans.add(
          TextSpan(
            text: remaining.substring(0, closestIndex),
            style: TextStyle(
              color: DefaultColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }

      // Add the highlighted word
      spans.add(
        TextSpan(
          text: foundWord,
          style: TextStyle(
            color: DefaultColors.blueLightBase,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

      // Move the pointer past the processed highlight
      remaining = remaining.substring(closestIndex + foundWord.length);
    }

    return spans;
  }
}
