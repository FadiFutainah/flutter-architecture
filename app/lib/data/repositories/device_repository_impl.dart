import 'package:app/domain/repositories/device_repository.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  @override
  String getAppVersion() {
    return const String.fromEnvironment('APP_VERSION');
  }
}
