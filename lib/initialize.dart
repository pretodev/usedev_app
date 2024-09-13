import 'dart:async';

import 'package:auto_injector/auto_injector.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

import 'firebase_options.dart';

typedef InitializeBuilder = FutureOr<Widget> Function(AutoInjector i);

Future<void> initializeApp(InitializeBuilder builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final app = await builder(_injector);

  _injector.commit();

  runApp(app);
}

final _injector = AutoInjector();

mixin ServiceLocatorMixin on Object {
  T getService<T>({Param? Function(Param)? transform, String? key}) {
    return _injector.get<T>(transform: transform, key: key);
  }
}
