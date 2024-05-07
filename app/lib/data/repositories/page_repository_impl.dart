import 'package:app/data/models/enums.dart';
import 'package:app/data/models/response_entity.dart';
import 'package:app/data/repositories/remote_repository.dart';
import 'package:app/domain/entities/entity/entity.dart';
import 'package:app/domain/repositories/entity_repository.dart';

class EntityRepositoryImpl extends RemoteRepository
    implements EntityRepository {
  @override
  Future<ResponseEntity> add(Entity entity) async {
    ResponseEntity response = await RemoteRepository.restApiService.request(
      'api/entity/',
      HttpRequestType.post,
      body: entity.toJson(),
    );
    return response;
  }

  @override
  Future<ResponseEntity> get() async {
    ResponseEntity response = await RemoteRepository.restApiService.request(
      'api/entity/',
      HttpRequestType.get,
    );
    return response;
  }
}
