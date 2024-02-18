import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';

class RowContentWidget extends StatelessWidget {
  const RowContentWidget({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              content,
              style: GoogleFonts.poppins(color: Colors.black),
            ),
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.edit,
          //     color: primarygreen,
          //   ),
          // )
        ],
      ),
    );
  }
}
