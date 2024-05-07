import 'package:app/service_locator.dart';
import 'package:flutter/material.dart';

import 'application/application.dart';

Future<void> main() async {
  initServiceLocator();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Application());
}
