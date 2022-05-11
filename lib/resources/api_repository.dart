import 'api_provider.dart';
import 'package:test_axles/models/seals_model.dart';


class ApiRepository {
  final _provider = ApiProvider();

  Future<Objects> fetchSealsList() {
    return _provider.fetchSealsList();
  }
}

class NetworkError extends Error {}
