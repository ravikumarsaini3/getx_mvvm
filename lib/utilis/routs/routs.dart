import 'package:get/get.dart';
import 'package:getx_mvvm/utilis/routs/routs_name.dart';
import 'package:getx_mvvm/view/auth_view/login_view.dart';
import 'package:getx_mvvm/view/auth_view/signup_view.dart';
import 'package:getx_mvvm/view/home_view.dart';
import 'package:getx_mvvm/view/splash_view.dart';

class Routs {
  static routs() => [
        GetPage(
          name: RoutsName.splashview,
          page: () => SplashView(),
        ),
        GetPage(
          name: RoutsName.loginview,
          page: () => LoginView(),
        ),
        GetPage(
          name: RoutsName.signupview,
          page: () => Signupview(),
        ),
        GetPage(
          name: RoutsName.homeview,
          page: () => HomeView(),
        )
      ];
}
