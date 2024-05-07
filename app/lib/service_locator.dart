import 'package:app/data/repositories/page_repository_impl.dart';
import 'package:app/domain/repositories/entity_repository.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void initServiceLocator() {
  serviceLocator.registerLazySingleton<EntityRepository>(
    () => EntityRepositoryImpl(),
  );
}
