import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hares/api/api_helper.dart';
import 'package:hares/models/auth/auth.dart';
import 'package:hares/models/auth/check_sms.dart';
import 'package:hares/models/auth/forget_password.dart';
import 'package:hares/models/auth/logout.dart';
import 'package:hares/models/auth/register.dart';
import 'package:hares/models/auth/resend_code.dart';
import 'package:hares/models/auth/reset_password.dart';
import 'package:hares/models/categories.dart';
import 'package:hares/models/companies/add_company.dart';
import 'package:hares/models/make_report.dart';
import 'package:hares/models/notifications.dart';
import 'package:hares/models/phone_links.dart';
import 'package:hares/models/repots.dart';
import 'package:hares/models/settings/change_password.dart';
import 'package:hares/models/settings/edit_profile.dart';
import 'package:hares/models/settings/settings.dart';
import 'package:hares/models/splash.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_helper.dart';
import 'package:http/http.dart' as http;

class APIRequestes {
  static final _client = http.Client();

  static Future<Splash?> getSplashes() async {
    var response = await _client.get(Uri.parse(ApiHelper.SPLASH),
        headers: ApiHelper.langHeader());

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Splash splash = Splash.fromJson(body);
      log('getSplashes SUCCESS: ${jsonEncode(splash)}');
      return splash;
    } else {
      log('getSplashes ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Settings?> getSettings() async {
    var response = await _client.get(Uri.parse(ApiHelper.SETTINGS),
        headers: ApiHelper.langHeader());

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Settings settings = Settings.fromJson(body);
      log('getSettings SUCCESS: ${jsonEncode(settings)}');
      return settings;
    } else {
      log('getSettings ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<ChangePassword?> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    log('Old: $oldPassword');
    log('NEW: $newPassword');
    log('CONFIRM: $confirmPassword');
    var response = await _client.post(Uri.parse(ApiHelper.CHANGE_PASSWORD),
        headers: ApiHelper.tokenHeader(token: AppHelper.getUserToken()!),
        body: jsonEncode({
          'password_old': oldPassword,
          'password': newPassword,
          'password_confirmation': confirmPassword,
        }),
        encoding: Encoding.getByName('utf-8'));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      ChangePassword password = ChangePassword.fromJson(body);
      // log('changePassword SUCCESS: ${jsonEncode(password)}');
      return password;
    } else {
      log('changePassword ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Auth?> login(BuildContext context,
      {required String email, required String password}) async {
    var response = await _client.post(Uri.parse(ApiHelper.LOGIN),
        headers: ApiHelper.headers(),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        encoding: Encoding.getByName('utf-8'));

    if (response.statusCode == 201 || response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Auth auth = Auth.fromJson(body);
      log('login SUCCESS: ${jsonEncode(auth)}');
      return auth;
    } else {
      AppHelper.showCustomToast(
          context: context,
          title: 'check_login_data',
          textColor: Colors.white,
          background: AppColors.colorTextError);
      log('login ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Auth?> register(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String confirmPassword}) async {
    var response = await _client.post(Uri.parse(ApiHelper.REGISTER),
        headers: ApiHelper.headers(),
        body: jsonEncode({
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
          'password_confirmation': confirmPassword,
        }),
        encoding: Encoding.getByName('utf-8'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      var body = jsonDecode(response.body);
      Auth auth = Auth.fromJson(body);
      log('register SUCCESS: ${jsonEncode(auth)}');
      return auth;
    } else {
      log('register ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<CheckSms?> checkSMS({required String token, required String smsCode}) async {
    var response = await _client.post(Uri.parse(ApiHelper.CHECK_SMS),
    headers: ApiHelper.tokenHeader(token: token),
    body: jsonEncode({
      'email_code': smsCode
    }),
    encoding: Encoding.getByName('utf-8'),);

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      CheckSms sms = CheckSms.fromJson(body);
      log('checkSMS SUCCESS: ${jsonEncode(sms)}');
      return sms;
    } else {
    log('checkSMS ERROR: ${jsonDecode(response.body)}');
    return null;
    }
  }

  static Future<ResendCode?> resendCode({required String token, required String email}) async {
    var response = await _client.post(Uri.parse(ApiHelper.RESEND_CODE),
      headers: ApiHelper.tokenHeader(token: token),
      body: jsonEncode({
        'email': email
      }),
      encoding: Encoding.getByName('utf-8'),);

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      ResendCode code = ResendCode.fromJson(body);
      log('resendCode SUCCESS: ${jsonEncode(code)}');
      return code;
    } else {
      log('resendCode ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<ForgetPassword?> forgetPassword({required String email}) async {
    var response = await _client.post(Uri.parse(ApiHelper.FORGET_PASSWORD),
      headers: ApiHelper.headers(),
      body: jsonEncode({
        'email': email
      }),
      encoding: Encoding.getByName('utf-8'),);

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      ForgetPassword password = ForgetPassword.fromJson(body);
      log('forgetPassword SUCCESS: ${jsonEncode(password)}');
      return password;
    } else {
      log('forgetPassword ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<ResetPassword?> resetPassword({required String token, required String password}) async {
    var response = await _client.post(Uri.parse(ApiHelper.FORGET_PASSWORD),
      headers: ApiHelper.tokenHeader(token: token),
      body: jsonEncode({
        'password': password
      }),
      encoding: Encoding.getByName('utf-8'),);

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      ResetPassword password = ResetPassword.fromJson(body);
      log('resetPassword SUCCESS: ${jsonEncode(password)}');
      return password;
    } else {
      log('resetPassword ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }



  static Future<Logout?> logout() async {
    var response = await _client.post(Uri.parse(ApiHelper.LOGOUT),
        headers: ApiHelper.tokenHeader(token: AppHelper.getUserToken()!));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Logout logout = Logout.fromJson(body);
      return logout;
    } else {
      log('logout ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Categories?> getCategories({int categoryId = 0}) async {
    var response = await _client.get(
        Uri.parse('${ApiHelper.CATEGORIES}?category_id=$categoryId'),
        headers: ApiHelper.langHeader());
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Categories categories = Categories.fromJson(body);
      // log('getCategories SUCCESS: ${jsonEncode(categories)}');
      return categories;
    } else {
      log('getCategories ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<PhoneLinks?> getPhones(
      {int categoryId = 0, String type = 'phone', String search = ''}) async {
    // TODO PARAMS [link,phone,company]
    log('CATEGORY: $categoryId');
    log('TYPE: $type');
    log('SEARCH: $search');
    var response = await _client.get(
        Uri.parse(
            '${ApiHelper.PHONES_LINKS}?category_id=$categoryId&type=phone&phone=$search'),
        headers: ApiHelper.langHeader());
    log('LINK: ${response.request!.url}');
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      PhoneLinks phoneLinks = PhoneLinks.fromJson(body);
      // log('getPhonesLinks SUCCESS: ${jsonEncode(phoneLinks)}');
      return phoneLinks;
    } else {
      log('getPhonesLinks ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<PhoneLinks?> getLinks(
      {int categoryId = 0, String type = 'link', String search = ''}) async {
    // TODO PARAMS [link,phone,company]
    log('CATEGORY: $categoryId');
    log('TYPE: $type');
    log('SEARCH: $search');
    var response = await _client.get(
        Uri.parse(
            '${ApiHelper.PHONES_LINKS}?category_id=$categoryId&type=link&phone=$search'),
        headers: ApiHelper.langHeader());
    log('LINK: ${response.request!.url}');
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      PhoneLinks phoneLinks = PhoneLinks.fromJson(body);
      // log('getPhonesLinks SUCCESS: ${jsonEncode(phoneLinks)}');
      return phoneLinks;
    } else {
      log('getPhonesLinks ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Reports?> getReports(
      {int reportId = 0, String search = ''}) async {
    var response = await _client.get(
        Uri.parse('${ApiHelper.REPORTS}?repot_id=$reportId&phone=$search'),
        headers: ApiHelper.langHeader());
    log('getReports ERROR: ${jsonDecode(response.body)}');
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Reports reports = Reports.fromJson(body);
      log('getReports SUCCESS: ${jsonEncode(reports)}');
      return reports;
    } else {
      log('getReports ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }


  static Future<MakeReport?> makeReport({required int id, required String description}) async {
    var response = await _client.post(Uri.parse(ApiHelper.MAKE_REPORT),
    headers: ApiHelper.tokenHeader(token: AppHelper.getUserToken()!),
    body: jsonEncode({
      'id': id,
      'description': description
    }), encoding: Encoding.getByName('utf-8'));

    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      MakeReport report = MakeReport.fromJson(body);
      log('makeReport SUCCESS: ${jsonEncode(report)}');
      return report;
    }else {
      log('makeReport ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<AddCompany?> addCompany({
    required String companyName,
    required String companyNo,
    required String companyAddress,
    required String phone,
    required String websiteLink,
    required int categoryId,
    required String commercialRegisterImagePath,
    required String imagePath,
  }) async {
log('NAME $companyName');
log('Number $companyNo');
log('ADDRESS $companyAddress');
log('PHONE $phone');
log('LINK $websiteLink');
log('CATEGORY $categoryId');
log('commercialRegisterImagePath $commercialRegisterImagePath');
log('imagePath $imagePath');
    var request = http.MultipartRequest('POST', Uri.parse(ApiHelper.ADD_COMPANY));
    request.headers.addAll(ApiHelper.tokenHeader(token: AppHelper.getUserToken()!));
    request.fields['company_name'] = companyName;
    request.fields['company_no'] = companyNo;
    request.fields['company_address'] = companyAddress;
    request.fields['phone'] = phone;
    request.fields['website_link'] = websiteLink;
    request.fields['categroy_id'] = categoryId.toString();

    request.files.add(await http.MultipartFile.fromPath('commercial_register_image', commercialRegisterImagePath,
        filename: imagePath.split('/').last));

    request.files.add(await http.MultipartFile.fromPath('image', imagePath,
        filename: imagePath.split('/').last));

    var stream = await request.send();
    var response = await http.Response.fromStream(stream);

    if(response.statusCode == 200 || response.statusCode == 201){
      var body = jsonDecode(response.body);
      AddCompany company = AddCompany.fromJson(body);
      log('addCompany SUCCESS: ${jsonEncode(company)}');
      return company;
    }else {
      log('addCompany ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<EditProfile?> editProfile({
    required String phone,
    required String email,
    required String name,
    required String imagePath,
}) async {
    var request = http.MultipartRequest('POST', Uri.parse(ApiHelper.EDIT_PROFILE));
    request.headers.addAll(ApiHelper.tokenHeader(token: AppHelper.getUserToken()!));
    request.fields['phone'] = phone;
    request.fields['email'] = email;
    request.fields['name'] = name;

    request.files.add(await http.MultipartFile.fromPath('image', imagePath,
        filename: imagePath.split('/').last));

    var stream = await request.send();
    var response = await http.Response.fromStream(stream);

    if(response.statusCode == 200 || response.statusCode == 201){
      var body = jsonDecode(response.body);
      EditProfile profile = EditProfile.fromJson(body);
      log('editProfile SUCCESS: ${jsonEncode(profile)}');
      return profile;
    }else {
      log('editProfile ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Notifications?> getNotifications() async {
    var response = await _client.get(Uri.parse(ApiHelper.NOTIFICATIONS),
    headers: ApiHelper.tokenHeader(token: AppHelper.getUserToken()!));

    if(response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Notifications notifications = Notifications.fromJson(body);
      log('getNotifications ERROR: ${jsonEncode(notifications)}');
      return notifications;
    }else {
     log('getNotifications ERROR: ${jsonDecode(response.body)}');
     return null;
    }
  }
}
