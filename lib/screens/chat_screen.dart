import 'package:flutter/material.dart';
import 'package:ia_odoo/constants/constants.dart';
import 'package:ia_odoo/customDrawer/drawerItem.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ia_odoo/widgets/chat_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();

}

class _ChatScreenState extends State<ChatScreen>{
  final bool _isTyping = true;

  late TextEditingController textEditingController;
  @override
  void initState(){
    textEditingController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 2, 
      title: Text("IA Odoo"),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_rounded, color: Colors.grey,))
      ],
      ),
      drawer: CustomDrawer.getDrawer(context),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context,index){
                return ChatWidget(msg: chatMessages[index]["msg"].toString(), chatIndex: int.parse(chatMessages[index]["chatIndex"].toString()));
              }  
              ) 
            
            ),
            if (_isTyping) ...[
             const SpinKitThreeBounce(
              color: Color.fromARGB(255, 127, 76, 247),
              size: 30,
             ),
             SizedBox(height: 15,),
             Material(
             
               child: Padding(
                padding: const EdgeInsets.all(8.0),
                 child: Row(
                  children: [
                    Expanded(
                      child: TextField(controller: textEditingController,
                      onSubmitted: (value){
                 
                      },
                      decoration: InputDecoration.collapsed( 
                        hintText: "Envia unmensaje a IA Odoo",
                        hintStyle: TextStyle(color: Colors.grey)
                      ),
                      )
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.send, color: Colors.grey,))
                  ],
                 ),
               ),
             )

            ]
          ],
        )
        ),
    );
  }
}