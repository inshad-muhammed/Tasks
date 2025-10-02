import 'package:flutter/material.dart';
import 'package:tasks/core/utils/size_config.dart';

class HighlightedText extends StatelessWidget {
  final String message;
  final List<String> highlights; // words/phrases to make blue

  const HighlightedText({
    super.key,
    required this.message,
    required this.highlights,
  });

  @override
  Widget build(BuildContext context) {
    final spans = _buildHighlightedText(message, highlights);

    return Text.rich(
      TextSpan(children: spans),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  List<TextSpan> _buildHighlightedText(String text, List<String> highlights) {
    final spans = <TextSpan>[];
    String remaining = text;

    while (remaining.isNotEmpty) {
      // find the first highlight that appears in the text
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
        // no highlight found, push remaining as normal
        spans.add(
          TextSpan(
            text: remaining,
            style: TextStyle(
              color: Colors.black,
              fontSize: SizeConfig.screenWidth * 0.032,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
        break;
      }

      // Add text before the highlight (normal)
      if (closestIndex > 0) {
        spans.add(
          TextSpan(
            text: remaining.substring(0, closestIndex),
            style: TextStyle(
              color: Colors.black,
              fontSize: SizeConfig.screenWidth * 0.032,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }

      // Add the highlight word (blue)
      spans.add(
        TextSpan(
          text: foundWord,
          style: TextStyle(
            color: Colors.blue,
            fontSize: SizeConfig.screenWidth * 0.032,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

      // cut off processed part
      remaining = remaining.substring(closestIndex + foundWord.length);
    }

    return spans;
  }
}
