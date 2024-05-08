import 'package:app/application/features/post/post_cubit.dart';
import 'package:app/application/util/router/app_router.dart';
import 'package:app/application/util/theme/primary_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(),
      child: MaterialApp.router(
        routerConfig: appRouter,
        theme: primaryTheme,
        color: primaryTheme.primaryColor,
        title: 'Title',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
