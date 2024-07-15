import 'package:flutter/cupertino.dart';
import 'package:fluttergeminiai/component/GeminiLayout.dart';
import 'package:fluttergeminiai/component/UserLayout.dart';

///对话-根据isFromUser选择布局
class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    this.image,
    this.text,
    required this.isFromUser,
    required this.role,
  });

  final Image? image;
  final String? text;
  final bool isFromUser;
  final String role;

  @override
  Widget build(BuildContext context) {
    return isFromUser
        ? UserLayout(isFromUser: true, role: "User", text: text, image: image)
        : GeminiLayout(isFromUser: false, role: "Gemini", text: text, image: image);
  }
}
