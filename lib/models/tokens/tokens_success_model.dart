import 'tokens_model.dart';

class TokensSuccessModel extends TokensModel {
  String? token;
  String? refreshToken;
  String? refreshTokenExpiryTime;

  TokensSuccessModel(
      {this.token, this.refreshToken, this.refreshTokenExpiryTime});

  TokensSuccessModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refreshToken'];
    refreshTokenExpiryTime = json['refreshTokenExpiryTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    data['refreshTokenExpiryTime'] = refreshTokenExpiryTime;
    return data;
  }
}
