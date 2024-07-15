import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
/// 对话-User用户布局
class UserLayout extends StatelessWidget {

  const UserLayout({
    super.key,
    this.image,
    this.text,
    required this.isFromUser,
    required this.role
  });

  final Image? image;
  final String? text;
  final bool isFromUser;
  final String role;
  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(child: Text(role.substring(0, 1))),
        Container(
            margin: const EdgeInsets.only(right: 8),
            child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(role),
              Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  decoration: BoxDecoration(
                    color: isFromUser
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Column(children: [
                    if (image case final image?) image,
                    if (text case final text?) MarkdownBody(data: text)
                  ]))
            ]))
      ],
    );
  }

}