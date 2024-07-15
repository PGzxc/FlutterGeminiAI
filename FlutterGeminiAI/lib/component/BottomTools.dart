import 'package:flutter/material.dart';


///@desc：发送消息的底部导航
class BottomTools extends StatelessWidget{
  final VoidCallback imgPressed; //选择图片点击
  final VoidCallback msgPressed; //发送消息点击
  final TextEditingController textController;
  final bool loading;
  const BottomTools({super.key, required this.textController,  required this.loading,required this.imgPressed, required this.msgPressed});

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.bottomRight,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: "发个消息吧",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none),
                fillColor: Colors.transparent,
              ),
              maxLines: null,
              keyboardType: TextInputType.multiline,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add_a_photo),
            onPressed: imgPressed,
          ),
          IconButton(
            // icon: const Icon(Icons.send),
            icon: loading
                ? const CircularProgressIndicator()
                : const Icon(Icons.send),
            onPressed: msgPressed,
          ),
        ],
      ),
    );
  }

}