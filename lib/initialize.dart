import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

import 'firebase_options.dart';

typedef InitializeBuilder = FutureOr<Widget> Function();

Future<void> initializeApp(InitializeBuilder builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final app = await builder();

  runApp(app);
}
