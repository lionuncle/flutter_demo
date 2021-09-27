

import 'package:flutter_demo/screens/home/home.dart';
import 'package:flutter_demo/screens/login_screen/login_screen.dart';
import 'package:flutter_demo/screens/signup_screen/signup_screen.dart';

class Routes {
  static const String login = '/';
  static const String signup = '/signup';
  static const String home = '/home';

  static final routes = {
    login: (context) => LoginScreen(),
    signup: (context) => SignupScreen(),
    home: (context) => Home(),
  };
}
