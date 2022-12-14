import 'package:flutter/material.dart';
import 'package:flutter_project_30/social_screen/social_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SocialApp(),
    );
  }
}
