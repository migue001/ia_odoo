import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ia_odoo/constants/constants.dart';

class ChatWidget extends StatelessWidget{
  const ChatWidget({super.key, required this.msg, required this.chatIndex});
  final String msg;
  final int chatIndex;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? scaffoldBackgroundColor: const Color.fromARGB(255, 211, 211, 211),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  chatIndex == 0 ? Icons.person : Icons.info
                ),
               const SizedBox(width: 8,),
                Expanded(
                  child: Text(
                    msg
                    )
                  ),
                  chatIndex == 0 ? const SizedBox.shrink()
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.thumb_up_alt_outlined,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 5,),
                      Icon(Icons.thumb_down_alt_outlined, color: Colors.grey,)
                    ],
                  )
              ],
            ),
            ),
        )
      ],
    );
  }
}