import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/models/notification.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard(
      {super.key, required this.notification, required this.markAsRead});

  final Notif notification;
  final void Function() markAsRead;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {},
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              offset: const Offset(0, 2),
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        height: 420,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              notification.img,
              fit: BoxFit.cover,
              height: 300,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              notification.title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              notification.message,
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
