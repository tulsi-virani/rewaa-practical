import '../Provider/new_provider.dart';

class Repository {
  ApiProvider appApiProvider = ApiProvider();

  Future<dynamic> fetchLondonNews() => appApiProvider.fetchLondonNews();
}
