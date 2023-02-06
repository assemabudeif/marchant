import '../data/remote/api_services.dart';
import '../models/tokens/tokens_model.dart';

class Repository {
  static final instance = Repository._internal();
  Repository._internal();
  factory Repository() => instance;

  Future<TokensModel> getToken() async {
    return await ApiServices.instance.getToken();
  }
}
