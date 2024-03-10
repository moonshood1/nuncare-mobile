import 'package:flutter/material.dart';

class ImagesEditionWidget extends StatelessWidget {
  const ImagesEditionWidget({
    super.key,
    required this.openImg,
    required this.openCover,
  });

  final void Function() openImg, openCover;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text(
              "Modifier l'image de profil",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
            onTap: () => {
              Navigator.pop(context),
              openImg(),
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text(
              "Modifier l'image de couverture",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
            onTap: () => {
              Navigator.pop(context),
              openCover(),
            },
          ),
        ],
      ),
    );
  }
}
