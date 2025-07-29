

import 'package:hares/utils/app_helper.dart';

class ApiHelper {
  // static const String _baseURL = 'https://lemonchiffon-curlew-844671.hostingersite.com/api';
  static const String _baseURL = 'https://api.harisksa.com/api';

// TODO SETTINGS
  static const String SPLASH = '$_baseURL/splash';
  static const String SETTINGS = '$_baseURL/setting';
  static const String CHANGE_PASSWORD = '$_baseURL/change_password';
  static const String EDIT_PROFILE = '$_baseURL/update_profile';

  // TODO AUTHENTICATION
  static const String LOGIN = '$_baseURL/login';
  static const String REGISTER = '$_baseURL/register';
  static const String CHECK_SMS = '$_baseURL/check_email_code';
  static const String RESEND_CODE = '$_baseURL/resend_email_code';
  static const String FORGET_PASSWORD = '$_baseURL/forget_password';
  static const String RESET_PASSWORD = '$_baseURL/reset_password';
  static const String LOGOUT = '$_baseURL/logout';

  // TODO DATA
  static const String CATEGORIES = '$_baseURL/categories';
  static const String PHONES_LINKS = '$_baseURL/links_phone_company';
  static const String REPORTS = '$_baseURL/repots';
  static const String ADD_COMPANY = '$_baseURL/add_company_verify';
  static const String MAKE_REPORT = '$_baseURL/add_report';

  // TODO NOTIFICATIONS
  static const String NOTIFICATIONS = '$_baseURL/notifications';

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