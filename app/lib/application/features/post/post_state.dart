part of 'post_cubit.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object?> get props => [];
}

class Initial extends PostState {}

class Loading extends PostState {}

class Success extends PostState {
  final Post post;

  const Success({required this.post});

  @override
  List<Object?> get props => [post];
}

class Failed extends PostState {
  final String message;

  const Failed({required this.message});

  @override
  List<Object?> get props => [message];
}
