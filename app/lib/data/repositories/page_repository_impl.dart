import 'package:app/data/models/enums.dart';
import 'package:app/data/models/response_entity.dart';
import 'package:app/data/repositories/remote_repository.dart';
import 'package:app/domain/entities/post/post.dart';
import 'package:app/domain/repositories/entity_repository.dart';

class PostRepositoryImpl extends RemoteRepository implements PostRepository {
  @override
  Future<ResponseEntity> add(Post post) async {
    ResponseEntity response = await RemoteRepository.restApiService.request(
      'api/post/',
      HttpRequestType.post,
      body: post.toJson(),
    );
    return response;
  }

  @override
  Future<ResponseEntity> get() async {
    ResponseEntity response = await RemoteRepository.restApiService.request(
      'api/post/',
      HttpRequestType.get,
    );
    return response;
  }
}
