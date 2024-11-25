import 'package:flutter/material.dart';
import 'customDrawer/drawerItem.dart';
import 'screens/chat_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return myMaterialApp(context);
  }
  
  Widget myMaterialApp(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ChatScreen()
    );
  }
}





