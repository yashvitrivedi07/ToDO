import 'package:get/get.dart';
import 'package:to_do_application/screens/edit_screen.dart';
import 'package:to_do_application/screens/home_screen.dart';
import 'package:to_do_application/screens/login_screen.dart';
import 'package:to_do_application/screens/signup_screen.dart';
import 'package:to_do_application/screens/splash_screen.dart';

class GetPages {
  static String splash = '/';
  static String home = '/home';
  static String login = '/login';
  static String signup = '/signup';
    static String edit = '/edit';


  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: signup,
      page: () => SignupScreen(),
    ),
    GetPage(
      name: edit,
      page: () => EditScreen(),
    ),
  ];
}
