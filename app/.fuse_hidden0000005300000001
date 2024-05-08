import 'package:get_it/get_it.dart';
import 'package:studentapp/data/repositories/device_repository_impl.dart';
import 'package:studentapp/data/repositories/firebase_repository_impl.dart';
import 'package:studentapp/data/repositories/page_repository_impl.dart';
import 'package:studentapp/data/repositories/system_info_repository_impl.dart';
import 'package:studentapp/data/repositories/teacher_repository_impl.dart';
import 'package:studentapp/data/repositories/user_repository_impl.dart';
import 'package:studentapp/data/repositories/wallet_repository_impl.dart';
import 'package:studentapp/domain/repositories/device_repository.dart';
import 'package:studentapp/domain/repositories/firebase_repository.dart';
import 'package:studentapp/domain/repositories/page_repository.dart';
import 'package:studentapp/domain/repositories/system_info_repository.dart';
import 'package:studentapp/domain/repositories/teacher_repository.dart';
import 'package:studentapp/domain/repositories/user_repository.dart';
import 'package:studentapp/domain/repositories/wallet_repository.dart';

GetIt serviceLocator = GetIt.instance;

void initServiceLocator() {
  serviceLocator.registerLazySingleton<PageRepository>(
    () => PageRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<DeviceRepository>(
    () => DeviceRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<FirebaseRepository>(
    () => FirebaseRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<WalletRepository>(
    () => WalletRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<TeacherRepository>(
    () => TeacherRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<SystemInfoRepository>(
    () => SystemInfoRepositoryImpl(),
  );
}
