import 'package:flutter/material.dart';
import 'package:nuncare/common/colors.dart';

class RowContentWidget extends StatelessWidget {
  const RowContentWidget({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.circle,
        color: primarygreen,
      ),
      title: Text(
        content,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w200,
        ),
      ),
      onTap: () => {
        print('tapped'),
      },
    );
  }
}
