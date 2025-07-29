import 'package:get/get.dart';
import 'package:hares/ui/auth/forget_password_screen.dart';
import 'package:hares/ui/auth/login_screen.dart';
import 'package:hares/ui/auth/register_screen.dart';
import 'package:hares/ui/auth/reset_password_screen.dart';
import 'package:hares/ui/auth/verification_screen.dart';
import 'package:hares/ui/boarding_screen.dart';
import 'package:hares/ui/home/home_screen.dart';
import 'package:hares/ui/home/notifications_screen.dart';
import 'package:hares/ui/home/profile_screen.dart';
import 'package:hares/ui/home/search_screen.dart';
import 'package:hares/ui/settings/about_screen.dart';
import 'package:hares/ui/settings/change_password_screen.dart';
import 'package:hares/ui/settings/policy_screen.dart';
import 'package:hares/ui/settings/terms_screen.dart';
import 'package:hares/ui/splash_screen.dart';

class AppRoutes {

  static final routesPages = [
    GetPage(name: Routes.splash, page: () => const SplashScreen()),
    GetPage(name: Routes.boarding, page: () => BoardingScreen()),
    GetPage(name: Routes.login, page: () => LoginScreen()),
    GetPage(name: Routes.register, page: () => RegisterScreen()),
    GetPage(name: Routes.verification, page: () => VerificationScreen()),
    GetPage(name: Routes.forgetPassword, page: () => ForgetPasswordScreen()),
    GetPage(name: Routes.resetPassword, page: () => ResetPasswordScreen()),
    GetPage(name: Routes.home, page: () => HomeScreen()),
    GetPage(name: Routes.search, page: () => SearchScreen()),
    GetPage(name: Routes.notifications, page: () => NotificationsScreen()),
    GetPage(name: Routes.policy, page: () => PolicyScreen()),
    GetPage(name: Routes.terms, page: () => TermsScreen()),
    GetPage(name: Routes.about, page: () => AboutScreen()),
    GetPage(name: Routes.profile, page: () => ProfileScreen()),
    GetPage(name: Routes.changePassword, page: () => ChangePasswordScreen()),
  ];
}

class Routes {

  static const splash = '/splash';
  static const boarding = '/boarding';
  static const login = '/login';
  static const register = '/register';
  static const verification = '/verification';
  static const forgetPassword = '/forget_password';
  static const resetPassword = '/reset_password';
  static const home = '/home';
  static const search = '/search';
  static const notifications = '/notifications';
  static const policy = '/policy';
  static const terms = '/terms';
  static const about = '/about';
  static const profile = '/profile';
  static const changePassword = '/change_password';

}