import 'package:app/data/models/response_entity.dart';
import 'package:app/domain/entities/entity/entity.dart';

abstract class EntityRepository {
  Future<ResponseEntity> get();
  Future<ResponseEntity> add(Entity entity);
}
