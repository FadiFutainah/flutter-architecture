import 'package:app/data/models/enums.dart';
import 'package:app/data/services/rest_api/rest_api_service.dart';

class RemoteRepository {
  static RestApiService restApiService = RestApiService(
    serverAddress: '',
    tokenType: TokenType.jwt,
  );
}
