import 'package:dio/dio.dart';

import '/data/remote/dio_logger.dart';
import '/models/tokens/tokens_error400_model.dart';
import '/models/tokens/tokens_model.dart';
import '../../models/tokens/tokens_error_model.dart';
import '../../models/tokens/tokens_success_model.dart';

class ApiServices {
  ApiServices._instance();
  static final ApiServices instance = ApiServices._instance();
  Dio dio = DioLogger.getDio();

  Future<TokensModel> getToken() async {
    try {
      // TODO: Handle Get Tokens Success
      Response response = await dio.post(
        Endpoints.tokens,
        data: {
          "email": "admin@root.com",
          "password": "123Pa\$\$word!",
        },
      );
      if (response.statusCode == 200) {
        return TokensSuccessModel.fromJson(response.data);
      } else {
        return TokensErrorModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      // TODO Handle Get Tokens Error
      if (e.response!.statusCode == 400) {
        return TokensError400Model.fromJson(e.response!.data);
      } else {
        return TokensErrorModel.fromJson(e.response!.data);
      }
    }
  }
}

class Endpoints {
  static const String baseUrl = 'http://yomycart.com';
  static const String tokens = 'http://yomycart.com/api/tokens';
}
