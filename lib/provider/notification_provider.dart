// import 'package:flutter/foundation.dart';
// import '../service/notification_service.dart';
//
// class NotificationProvider with ChangeNotifier {
//   final NotificationService _notificationService = NotificationService.I;
//
//
//   Future<void> init() async {
//     await _notificationService.init();
//   }
//
//   Future<void> showNow() async {
//     await _notificationService.showNow(
//       id: 0,
//       title: "Instant Notification",
//       body: "This is shown immediately.",
//     );
//   }
//
//   Future<void> scheduleAfter5Sec() async {
//     await _notificationService.scheduleInSeconds(
//       id: 1,
//       title: "Scheduled Notification",
//       body: "This notification was scheduled 5 sec ago.",
//       seconds: 5,
//     );
//   }
// }
