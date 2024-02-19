import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/models/notification.dart';
import 'package:nuncare/screens/notifications/components/notification_card.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key, required this.notifications});

  final List<Notif> notifications;

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  void _readNotification() async {}

  @override
  Widget build(BuildContext context) {
    Widget notificationsContent = Center(
      child: Text(
        'Aucune notification pour l\'instant',
        style: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w200,
        ),
      ),
    );

    if (widget.notifications.isNotEmpty) {
      notificationsContent = ListView.builder(
        itemCount: widget.notifications.length,
        itemBuilder: (BuildContext ctx, int index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: NotificationCard(
            markAsRead: _readNotification,
            notification: widget.notifications[index],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarygreen,
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: notificationsContent,
    );
  }
}
