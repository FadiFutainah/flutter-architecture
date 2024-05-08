import 'package:app/data/models/response_entity.dart';
import 'package:app/domain/entities/post/post.dart';

abstract class PostRepository {
  Future<ResponseEntity> get();
  Future<ResponseEntity> add(Post post);
}
