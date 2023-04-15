import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';



import 'main.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  //FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  // late int _totalNotifications;
  // PushNotification? _notificationInfo;
  // late final FirebaseMessaging _messaging;

  // void registerNotification() async {
  //   // For handling the received notifications
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //
  //       // For displaying the notification as an overlay
  //       showSimpleNotification(
  //         Text(message.notification!.title.toString()),
  //         leading: NotificationBadge(totalNotifications: 2),
  //         subtitle: Text(message.notification!.body.toString()),
  //         background: Colors.cyan.shade700,
  //         duration: Duration(seconds: 2),
  //       );
  //
  //   });
  // }

  @override
  void initState() {
    var initialzationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
    InitializationSettings(android: initialzationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);


    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                color: Colors.blue,
                icon: "@mipmap/ic_launcher",
              ),
            ));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notify'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'App for capturing Firebase Push Notifications',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 16.0),
          SizedBox(height: 16.0),
          // TODO: add the notification text here
        ],
      ),
    );
  }
}