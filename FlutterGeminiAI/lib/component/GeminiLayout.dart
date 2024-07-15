import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

/// 对话-Gemini布局
class GeminiLayout extends StatelessWidget {
  const GeminiLayout(
      {super.key,
      this.image,
      this.text,
      required this.isFromUser,
      required this.role});

  final Image? image;
  final String? text;
  final bool isFromUser;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(child: Text(role.substring(0, 1))),
        Container(
            margin: const EdgeInsets.only(left: 8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(role),
              Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  decoration: BoxDecoration(
                    color: isFromUser
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Column(children: [
                    if (image case final image?) image,
                    if (text case final text?) MarkdownBody(data: text),
                  ]))
            ]))
      ],
    );
  }
}
