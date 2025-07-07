

import 'package:hares/utils/app_helper.dart';

class ApiHelper {
  static const String _baseURL = 'https://webguard.psws.pl/api';



  // TODO AUTHENTICATION
  static const String LOGIN = '$_baseURL/auth/login';
  static const String REGISTER = '$_baseURL/users/register';
  static const String LOGOUT = '$_baseURL/auth/logout';

  // TODO FAVORITE




  static Map<String, String> langHeader() {
    return {
      'Content-Type': 'application/json',
      'X-Client-Language': AppHelper.getAppLanguage()
    };
  }

  static Map<String, String> tokenHeader({required String token}) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
      'X-Client-Device-Name': AppHelper.getDeviceName(),
      'X-Client-Language': AppHelper.getAppLanguage()
    };
  }

  static Map<String, String> allHeaders({required String token}) {
    return {
      'Content-Type': 'application/json',
      'Authorization': token,
      'X-Client-Language': AppHelper.getAppLanguage()
    };
  }

  //  "Authorization": PreferencesManager.getAppData(key: Const.KEY_FCM_TOKEN),
  static Map<String, String> headers() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Client-Language': AppHelper.getAppLanguage(),
      'X-Client-Device-Name': AppHelper.getDeviceName()
    };
  }
}