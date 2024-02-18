import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({
    super.key,
    required this.profileEdit,
    required this.passwordEdit,
    required this.imageEdit,
  });

  final void Function() profileEdit, passwordEdit, imageEdit;

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
                leading: const Icon(Icons.edit),
                title: const Text("Modifier le profil"),
                onTap: () => {Navigator.pop(context), profileEdit()},
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text("Modifier la photo de profil"),
                onTap: () => {Navigator.pop(context), imageEdit()},
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text("Modifier le mot de passe"),
                onTap: () => {Navigator.pop(context), passwordEdit()},
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  size: 20,
                  color: Colors.red.shade300,
                ),
                title: Text(
                  "Déconnexion",
                  style: GoogleFonts.poppins(
                    color: Colors.red.shade300,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
