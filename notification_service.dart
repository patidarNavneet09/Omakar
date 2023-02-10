import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettings =
        const AndroidInitializationSettings("ic_launcher");

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestCriticalPermission: true,
        // defaultPresentBadge: true,
        // defaultPresentSound: true,
        // defaultPresentAlert: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (id, title, body, String? payload) async => notificationsPlugin
                .show(id, title, body, await notificationDetails(),
                    payload: payload));

    var intializationSettings = InitializationSettings(
        android: initializationSettings, iOS: initializationSettingsIOS);

    await notificationsPlugin.initialize(intializationSettings,
        onDidReceiveBackgroundNotificationResponse:
            (NotificationResponse notifictionResponse) async {});
    //           await notificationsPlugin.initialize(intializationSettings,
    //     onSelectNotification: (String? payload) {
    //   if (payload != null) OpenFile.open(payload);
    // });
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
          "channelId",
          "channelName",
          importance: Importance.max,
          priority: Priority.max,
          icon: "ic_launcher",
          playSound: true,
        ),
        iOS: DarwinNotificationDetails());
  }

  Future Showotification(
      {int id = 0,
      required String title,
      String? body,
      String? payLoad}) async {
    return notificationsPlugin.show(
        id, title, body, await notificationDetails());
  }

  // void sendNotification(String title, String body) async {
  //   AndroidNotificationDetails androidNotificationDetails =
  //       AndroidNotificationDetails(
  //     "channelId",
  //     "channelName",
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );
  //   NotificationDetails notificationDetails = NotificationDetails(
  //     android: androidNotificationDetails,
  //   );
  //   await notificationsPlugin.show(
  //       0, title, body, notificationDetails);
  // }
}
// class NotificationApi{
//   static final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();
//   static Future _notificationDetailes() async => const NotificationDetails(
//     android: AndroidNotificationDetails(
//       "channel id",
//       "channel name",
//       channelDescription: "channel description",
//       importance: Importance.max,
//       playSound: true
//     ),
//     iOS: IOSNotificationDetails(),
//   );
  
//   static Future showNotification({int id =0, String? title, String? body, String? payload}) async =>
//       _notifications.show(id, title, body, await _notificationDetailes(), payload: payload);
// }





















