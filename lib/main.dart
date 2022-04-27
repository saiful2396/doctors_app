import 'package:doctors_app/provider/message_provider.dart';
import 'package:doctors_app/screens/dashboard_sreen.dart';
import 'package:doctors_app/screens/detail_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'screens/doctor_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: MessageProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor Reputation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DoctorScreen(),
      routes: {
        DashBoardScreen.routeName: (ctx) => const DashBoardScreen(),
        DetailScreen.routeName: (ctx) => const DetailScreen(),
      },
    );
  }
}
