import 'package:flutter/material.dart';
import 'package:my_personal_website/home.dart';
import 'package:my_personal_website/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hemant Bansal | Software Engineer',
      theme: ThemeData(
        canvasColor: AppColors.backgroundBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Calibre',
        // useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
