import 'package:flutter/material.dart';
import 'package:nuncare/screens/profile/profile_details_screen.dart';

class ProfileRootScreen extends StatefulWidget {
  const ProfileRootScreen({super.key});

  @override
  State<ProfileRootScreen> createState() => _ProfileRootScreenState();
}

class _ProfileRootScreenState extends State<ProfileRootScreen> {
  @override
  Widget build(BuildContext context) {
    return const ProfileDetailsScreen();
  }
}
