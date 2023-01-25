// ignore_for_file: unused_field

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:sheraa/ui/notification/notifications_screen.dart';
import 'package:http/http.dart' as http;

class FirebaseNotifcationMessages {
  static reciveNotifactionWhenAppIsOpen(BuildContext context) {
    FirebaseMessaging.onMessage.listen((event) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => NotificationScreen(
                    isNotification: true,
                  )));
    });
  }

  static onTapOnNotificationWhenAppOnBackground(BuildContext context) {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => NotificationScreen(
                    isNotification: true,
                  )));
    });
  }

  static onTapOnNotificationWhenAppInTermenated(BuildContext context) async {
    var message = await FirebaseMessaging.instance.getInitialMessage();

    if (message != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => NotificationScreen(
                    isNotification: true,
                  )));
    }
  }

  static sendNotificationToRequestBuyAd(
      String title, String body, Map data, String userDeviceToken) async {
    String serverToken =
        "AAAAxvLKJYU:APA91bFZi5e3hjks6DkaFWIF7q7nIlQ5cjnrzxcw2DOD69zqBgZPzoGIWuk-LLFcxQz81OknXIsveBaPE-XlPbImAmwKrXsniyym0GOVUDOE30f9VlS9RQXBmJy7KoU7FqamhbkvNTNV";

    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': body,
            'title': title,
          },
          'priority': 'high',
          'data': data,
          'to': userDeviceToken,
        },
      ),
    );
  }
}
