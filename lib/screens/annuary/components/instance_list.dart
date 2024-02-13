import 'package:flutter/material.dart';

class InstanceList extends StatelessWidget {
  const InstanceList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: const BoxDecoration(),
          child: Row(
            children: [Image.network(""), const Text("Bonjour")],
          ),
        ),
      ),
    );
  }
}
