import 'package:flutter/material.dart';
import 'package:library_attendance/Screens/dashboard.dart';
import 'package:library_attendance/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Library Attendance',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, //Automatic switch
      home: const Dashboard(),
    );
  }
}
