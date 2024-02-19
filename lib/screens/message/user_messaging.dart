import 'package:flutter/material.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/models/user.dart';

class UserMessaging extends StatelessWidget {
  const UserMessaging({super.key, required this.recipient});

  final User recipient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarygreen,
        elevation: 2,
        title: Text("Conversation avec ${recipient.firstName}"),
      ),
      body: const Text("Service de messagerie à implementer"),
    );
  }
}
