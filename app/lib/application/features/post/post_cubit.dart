import 'package:app/data/models/response_entity.dart';
import 'package:app/domain/entities/post/post.dart';
import 'package:app/domain/repositories/entity_repository.dart';
import 'package:app/service_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(Initial()) {
    fetchPost();
  }

  void fetchPost() async {
    PostRepository repository = serviceLocator.get<PostRepository>();
    emit(Loading());
    ResponseEntity responseEntity = await repository.get();
    if (isClosed) {
      return;
    }
    if (!responseEntity.hasError) {
      Post post = Post.fromJson(responseEntity.data);
      emit(Success(post: post));
    } else {
      emit(Failed(message: responseEntity.message));
    }
  }
}
