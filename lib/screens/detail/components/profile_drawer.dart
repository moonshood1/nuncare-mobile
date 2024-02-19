import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/models/user.dart';

class DetailProfileDrawer extends StatelessWidget {
  const DetailProfileDrawer({
    super.key,
    required this.sendMessage,
  });

  final void Function() sendMessage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: const Icon(Icons.send),
                title: const Text("Envoyer un message"),
                onTap: () => {Navigator.pop(context), sendMessage()},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
