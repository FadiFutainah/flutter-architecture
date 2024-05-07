import 'package:app/application/util/router/app_router.dart';
import 'package:app/application/util/theme/primary_theme.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: primaryTheme,
      color: primaryTheme.primaryColor,
      title: 'Title',
      debugShowCheckedModeBanner: false,
    );
  }
}
