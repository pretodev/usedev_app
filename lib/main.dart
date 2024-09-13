import 'package:flutter/material.dart';

import 'initialize.dart';
import 'ui/screens/home/home_screen.dart';
import 'ui/styles/styles.dart';

void main() async {
  initializeApp(() => const UseDevApp());
}

class UseDevApp extends StatelessWidget {
  const UseDevApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppStyle().theme,
      home: const HomeScreen(),
    );
  }
}
