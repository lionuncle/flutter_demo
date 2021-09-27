
import 'package:flutter_demo/screens/home/home_provider.dart';
import 'package:flutter_demo/screens/login_screen/login_provider.dart';
import 'package:flutter_demo/screens/signup_screen/signup_provider.dart';
import 'package:provider/provider.dart';

final multiProviders = [
  ChangeNotifierProvider<LoginProvider>(
    create: (_) => LoginProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<SignupProvider>(
    create: (_) => SignupProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<HomeProvider>(
    create: (_) => HomeProvider(),
    lazy: true,
  ),
];
