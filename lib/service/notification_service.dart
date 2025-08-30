// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// //
// // class NotificationService {
// //   static final NotificationService _instance = NotificationService._internal();
// //   factory NotificationService() => _instance;
// //   NotificationService._internal();
// //
// //   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
// //   FlutterLocalNotificationsPlugin();
// //
// //   Future<void> init() async {
// //     const AndroidInitializationSettings androidInit =
// //     AndroidInitializationSettings('@mipmap/ic_launcher');
// //
// //     const InitializationSettings initSettings =
// //     InitializationSettings(android: androidInit);
// //
// //     await _flutterLocalNotificationsPlugin.initialize(initSettings);
// //   }
// //
// //   /// Show instant notification
// //   Future<void> showNotification({
// //     required int id,
// //     required String title,
// //     required String body,
// //   }) async {
// //     const AndroidNotificationDetails androidDetails =
// //     AndroidNotificationDetails(
// //       'demo_channel_id',
// //       'Demo Notifications',
// //       importance: Importance.max,
// //       priority: Priority.high,
// //     );
// //
// //     const NotificationDetails details = NotificationDetails(android: androidDetails);
// //
// //     await _flutterLocalNotificationsPlugin.show(id, title, body, details);
// //   }
// //
// //   /// Schedule notification after [seconds]
// //   Future<void> scheduleNotification({
// //     required int id,
// //     required String title,
// //     required String body,
// //     required int seconds,
// //   }) async {
// //     const AndroidNotificationDetails androidDetails =
// //     AndroidNotificationDetails(
// //       'demo_channel_id',
// //       'Demo Notifications',
// //       importance: Importance.max,
// //       priority: Priority.high,
// //     );
// //
// //     const NotificationDetails details = NotificationDetails(android: androidDetails);
// //
// //     await _flutterLocalNotificationsPlugin.zonedSchedule(
// //       id,
// //       title,
// //       body,
// //       DateTime.now().add(Duration(seconds: seconds)),
// //       details,
// //       androidAllowWhileIdle: true,
// //       uiLocalNotificationDateInterpretation:
// //       UILocalNotificationDateInterpretation.absoluteTime,
// //       matchDateTimeComponents: null, androidScheduleMode: null,
// //     );
// //   }
// // }
//
//
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_timezone/flutter_timezone.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
//
// class NotificationService {
//   NotificationService._();
//   static final NotificationService I = NotificationService._();
//
//   final _plugin = FlutterLocalNotificationsPlugin();
//
//   Future<void> init() async {
//     // Init plugin
//     const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
//     final settings = const InitializationSettings(android: androidInit);
//     await _plugin.initialize(settings);
//
//     // Android 13+ (API 33) notification permission prompt
//     final androidPlugin = _plugin.resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>();
//
//     if (androidPlugin != null) {
//       // This exists in v15.1.0+1
//       final granted = await androidPlugin.requestPermission();
//       if (granted ?? false) {
//         print("Notification permission granted ✅");
//       } else {
//         print("Notification permission denied ❌");
//       }
//     }
//
// // Android 14+ exact alarm permission is NOT built-in in v15.x.
// // You must handle it manually with the Android permission handler package
// // if you really need exact alarms on API 34+.
//
//
//     // // Android 13+ notification permission prompt
//     // final android = _plugin.resolvePlatformSpecificImplementation<
//     //     AndroidFlutterLocalNotificationsPlugin>();
//     // await android?.requestNotificationsPermission();
//     //
//     // // Android 14+ exact alarm permission (for exact scheduling)
//     // await android?.requestExactAlarmsPermission();
//
//     // Timezone setup
//     tz.initializeTimeZones();
//     try {
//       final name = await FlutterTimezone.getLocalTimezone();
//       tz.setLocalLocation(tz.getLocation(name));
//     } catch (_) {/* fallback to tz.local */}
//     // Optional: create channel up-front
//     await androidPlugin?.createNotificationChannel(const AndroidNotificationChannel(
//       'demo_channel',
//       'Demo',
//       description: 'Demo notifications',
//       importance: Importance.high,
//     ));
//   }
//
//   NotificationDetails _details() => const NotificationDetails(
//     android: AndroidNotificationDetails(
//       'demo_channel',
//       'Demo',
//       channelDescription: 'Demo notifications',
//       importance: Importance.high,
//       priority: Priority.high,
//     ),
//   );
//
//   Future<void> showNow({
//     required int id,
//     required String title,
//     required String body,
//   }) async {
//     await _plugin.show(id, title, body, _details());
//   }
//
//   //works in kill mode
//
//   Future<void> scheduleInSeconds({
//     required int id,
//     required String title,
//     required String body,
//     required int seconds,
//     bool exact = true,
//   }) async {
//     final when =
//     tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds));
//
//     // await _plugin.zonedSchedule(
//     //   id,
//     //   title,
//     //   body,
//     //   when,
//     //   _details(),
//     //   androidScheduleMode: exact
//     //       ? AndroidScheduleMode.exactAllowWhileIdle
//     //       : AndroidScheduleMode.inexactAllowWhileIdle, uiLocalNotificationDateInterpretation: ,
//     // );
//     await _plugin.zonedSchedule(
//       id,
//       title,
//       body,
//       when,
//       _details(),
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//       UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: null,
//     );
//   }
//
//   Future<void> cancel(int id) => _plugin.cancel(id);
//   Future<void> cancelAll() => _plugin.cancelAll();
//   Future<List<PendingNotificationRequest>> pending() =>
//       _plugin.pendingNotificationRequests();
// }
