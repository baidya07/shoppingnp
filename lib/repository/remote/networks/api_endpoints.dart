import 'package:flutter_dotenv/flutter_dotenv.dart';

enum APIPath{
  // * Home  APIS
  getHome,

  refreshToken

}

class APIPathHelper{
  static final String baseUrl =dotenv.env['BASE_URL'] ?? "";

  static String authAPIs(APIPath path, {String? keyword}) {
    switch (path) {
      case APIPath.getHome:
        return "/api/get-home-data";
      case APIPath.refreshToken:
        return "/token-refresh";
      default:
        return "";
    }
  }
}