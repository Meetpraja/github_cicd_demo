import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'provider/notification_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final notificationProvider = NotificationProvider();
  // await notificationProvider.init();

  // runApp(
  //   ChangeNotifierProvider(
  //     create: (_) => notificationProvider,
  //     child: const MyApp(),
  //   ),
  // );

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final notificationProvider = Provider.of<NotificationProvider>(context, listen: false);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("CI/CD Demo")),
        body: Center(
          child: Text('demo'),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     // ElevatedButton(
          //     //   onPressed: notificationProvider.showNow,
          //     //   child: const Text("Show Now"),
          //     // ),
          //     // const SizedBox(height: 20),
          //     // ElevatedButton(
          //     //   onPressed: notificationProvider.scheduleAfter5Sec,
          //     //   child: const Text("Schedule After 5 Seconds"),
          //     // ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
