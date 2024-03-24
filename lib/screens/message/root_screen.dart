import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/screens/message/components/chat_messages.dart';
import 'package:nuncare/screens/message/new_message_screen.dart';

class MessageRootScreen extends StatefulWidget {
  const MessageRootScreen({super.key});

  @override
  State<MessageRootScreen> createState() => _MessageRootScreenState();
}

class _MessageRootScreenState extends State<MessageRootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Messagerie",
        ),
        backgroundColor: primarygreen,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ChatMessages(),
            ),
            // NewMessageScreen()
          ],
        ),
      ),
    );
  }
}
