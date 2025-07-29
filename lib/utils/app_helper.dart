import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_toast/flutter_sliding_toast.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hares/models/user.dart';
import 'package:hares/utils/app_color.dart';
import 'package:hares/utils/app_text.dart';
import 'package:hares/utils/constants.dart';
import 'package:hares/utils/network_connectivity.dart';
import 'package:hares/widget/custom_loading.dart';
import 'package:url_launcher/url_launcher.dart';


import 'caching.dart';

class AppHelper {

  static String getAppLanguage() {
    if (Caching.getAppLanguage(key: Const.KEY_LANGUAGE) != null &&
        Caching.getAppLanguage(key: Const.KEY_LANGUAGE) != "") {
      String language =
      Caching.getAppLanguage(key: Const.KEY_LANGUAGE);
      if (language == Const.KEY_LANGUAGE_AR) {
        return Const.KEY_LANGUAGE_AR;
      } else if (language == Const.KEY_LANGUAGE_EN) {
        return Const.KEY_LANGUAGE_EN;
      } else {
        return Const.KEY_LANGUAGE_AR;
      }
    }
    return Const.KEY_LANGUAGE_AR;
  }

  static Locale? getAppLocale() {
    // print(
    // 'PREF LANG: ${PreferencesManager.getAppLanguage(key: Const.KEY_LANGUAGE)}');
    if (Caching.getAppLanguage(key: Const.KEY_LANGUAGE) != null &&
        Caching.getAppLanguage(key: Const.KEY_LANGUAGE) != "") {
      String? language =
      Caching.getAppLanguage(key: Const.KEY_LANGUAGE);

      if (language == Const.KEY_LANGUAGE_AR) {
        return const Locale(Const.KEY_LANGUAGE_AR);
      } else if (language == Const.KEY_LANGUAGE_EN) {
        return const Locale(Const.KEY_LANGUAGE_EN);
      } else {
        return const Locale(Const.KEY_LANGUAGE_AR);
      }
    } else {
      return const Locale(Const.KEY_LANGUAGE_AR);
    }
  }

  static String? getUserToken() {
    if (Caching.getUserToken(key: Const.KEY_USER_TOKEN) != null &&
        Caching.getUserToken(key: Const.KEY_USER_TOKEN) != "") {
      return 'Bearer ${Caching.getUserToken(
          key: Const.KEY_USER_TOKEN)}';
    }
    return null;
  }

  static User? getCurrentUser() {
    if (Caching.getUserData(key: Const.KEY_USER_DATA) != null) {
      return Caching.getUserData(key: Const.KEY_USER_DATA);
    } else {
      return null;
    }
  }


  static RegExp emailValidate() {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$s%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  }

  static RegExp phoneValidate() {
    return RegExp(
        r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)');
  }

  static double getItemSize(BuildContext context) {
    final data = MediaQueryData.fromView(View.of(context));
    return data.size.height < 450
        ? /* TODO PHONE */ 580
        : /* TODO TABLET */ 700;
  }

  static Future<void> launcherUrl(BuildContext context, {required  String url}) async {
    log('LINK: $url');
    if (url.isNotEmpty && url.contains('http')) {
      if (!await launchUrl(Uri.parse(url))) {
        throw Exception('Could not launch $url');
      }
    } else {
      showCustomToast(context: context,
          title: 'valid_link',
          isSuccess: false);
      // AppHelper.showCustomToast(
      //     context: context, title: 'valid_link', isSuccess: false);
    }
  }
  //
  static Future<void> launchWhatsapp(BuildContext context,
      {required String phoneOrLink}) async {
    log('NUMBER: $phoneOrLink');
    if (phoneOrLink.contains('http')) {
      launcherUrl(context, url: phoneOrLink);
    } else {
      var androidUrl = "whatsapp://send?phone=$phoneOrLink&text=Hi, I need some help";
      var iosUrl = "https://wa.me/$phoneOrLink?text=${Uri.parse('Hi, I need some help')}";
      try {
        if (Platform.isIOS) {
          await launchUrl(Uri.parse(iosUrl));
        }
        else {
          await launchUrl(Uri.parse(androidUrl));
        }
      } on Exception {
        AppHelper.showCustomToast(context: context,
            title: 'whatsapp_not_installed',
            isSuccess: false);
        // EasyLoading.showError('WhatsApp is not installed.');
      }
    }
  }

  static Future saveDeviceName() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      Caching.saveAppData(
          key: Const.KEY_DEVICE_NAME, value: androidInfo.model);
      print('Running on Android ${androidInfo.model}'); // e.g. "Moto G (4)"
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      Caching.saveAppData(
          key: Const.KEY_DEVICE_NAME, value: iosInfo.utsname.machine);
      print('Running on IOS ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"
    }
  }

  static String getDeviceName() {
    if (Caching.getAppData(key: Const.KEY_DEVICE_NAME) != null) {
      return Caching.getAppData(key: Const.KEY_DEVICE_NAME);
    } else {
      return '';
    }
  }

  static Future showLoadingDialog(BuildContext context) {
    return showDialog(
        context: context, builder: (con) => const CustomLoading());
  }

  static RxBool checkInternetConnectionStatus() {
    Map _source = {ConnectivityResult.none: false};
    RxBool isConnected = false.obs;
    final NetworkConnectivity _networkConnectivity = NetworkConnectivity
        .instance;
    // InternetConnectionStatus? _status;
    // String _network = '';
    //
    _networkConnectivity.initialise();
    _networkConnectivity.myStream.listen((source) {
      _source = source;
      log('networkConnectivity $_source');

      // 1.
      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          if (_source.values.toList()[0]) {
            isConnected(true);
            // _status = InternetConnectionStatus.CONNECTED;
            // _network = ConnectivityResult.mobile.name;
            isConnected(false);
          } else {
            // _status = InternetConnectionStatus.DISCONNECT;
            // _network = ConnectivityResult.mobile.name;

          }
          log('IS CONNECTED MOBILE: ${isConnected.value}');
          break;
        case ConnectivityResult.wifi:
          if (_source.values.toList()[0]) {
            isConnected(true);
            // _status = InternetConnectionStatus.CONNECTED;
            // _network = ConnectivityResult.wifi.name;
          } else {
            isConnected(false);
            // _status = InternetConnectionStatus.DISCONNECT;
            // _network = ConnectivityResult.wifi.name;
          }
          log('IS CONNECTED WIFI: ${isConnected.value}');
          break;
        case ConnectivityResult.none:
          if (_source.values.toList()[0]) {
            isConnected(true);
            // _status = InternetConnectionStatus.CONNECTED;
          } else {
            isConnected(false);
            // _status = InternetConnectionStatus.DISCONNECT;
          }
          log('IS CONNECTED NONE: ${isConnected.value}');
          break;
        case ConnectivityResult.other:
          if (_source.values.toList()[0]) {
            isConnected(true);
            // _status = InternetConnectionStatus.CONNECTED;
          } else {
            isConnected(false);
            // _status = InternetConnectionStatus.DISCONNECT;
          }
          log('IS CONNECTED OTHER: ${isConnected.value}');
          break;
        default:
          isConnected(false);
          // _status = InternetConnectionStatus.DISCONNECT;
          log('IS CONNECTED DEFAULT: ${isConnected.value}');
      }
    });
    return isConnected;
  }


  static Widget checkInternetConnectionText(RxBool isConnected) {
    return AppText.medium(
        text: connectionStatusName(isConnected),
        fontSize: getAppLanguage() == Const.KEY_LANGUAGE_AR ? 14 : 12,
        color: Colors.white);
  }

  static Color connectionStatusColor(RxBool isConnected) {
    if (isConnected.isTrue) {
      return AppColors.lightGreen1;
    } else {
      return AppColors.colorSnackBarIconError;
    }
  }

  static String connectionStatusName(RxBool isConnected) {
    if (isConnected.isTrue) {
      return 'internet_connected';
    } else {
      return 'internet_disconnected';
    }
  }

  static void showCustomToast({required BuildContext context,
    required String title,
    bool? isSuccess,
    Widget? icon,
    Color background = Colors.white,
    Color textColor = AppColors.colorAppMain}) {
    InteractiveToast.slide(
      context,
      title: AppText.medium(
          text: title,
          color: textColor,
          maxline: 2,
          fontSize: 13,
          fontWeight: FontWeight.w700),
      toastStyle: ToastStyle(
          borderRadius: BorderRadius.circular(50),
          titleLeadingGap: 10, backgroundColor: background,
          progressBarColor: Colors.white),
      toastSetting: const SlidingToastSetting(
        showProgressBar: false,
        animationDuration: Duration(seconds: 1),
        displayDuration: Duration(seconds: 2),
        toastStartPosition: ToastPosition.top,
        toastAlignment: Alignment.topCenter,
      ),
    );
  }

}

class TrailingWidget extends StatelessWidget {
  Widget? icon;
  bool? isSuccess;

  TrailingWidget({super.key, this.icon, this.isSuccess});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: isSuccess == null
                ? SvgPicture.asset('${Const.icons}icon_success.svg')
                : SvgPicture.asset('${Const.icons}icon_error.svg')));
  }
}

class LeadingWidget extends StatelessWidget {
  const LeadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.purple,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              spreadRadius: 3,
              blurRadius: 4,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: const Text(
          "🦄",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
