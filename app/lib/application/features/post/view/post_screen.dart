import 'package:app/application/features/post/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        listener: (context, state) {
          if (state is Failed) {
            Fluttertoast.showToast(msg: state.message);
          }
        },
        builder: (context, state) {
          if (state is Success) {
            // the data of the post can be reached from state.post
            return const Placeholder(); // widget to view the post
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
