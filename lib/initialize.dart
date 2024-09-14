import 'dart:async';

import 'package:auto_injector/auto_injector.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'config/remote_config.dart';
import 'firebase_options.dart';

typedef InitializeBuilder = FutureOr<Widget> Function(AutoInjector i);

Future<void> initializeApp(InitializeBuilder builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await RemoteConfig.instance.load();

  final baseApp = await builder(_injector);

  _injector.commit();

  final app = Provider(
    create: (_) => RemoteConfig.instance.contact,
    child: baseApp,
  );

  runApp(app);
}

final _injector = AutoInjector();

mixin ServiceLocatorMixin on Object {
  T getService<T>({Param? Function(Param)? transform, String? key}) {
    return _injector.get<T>(transform: transform, key: key);
  }
}
