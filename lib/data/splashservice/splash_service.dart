import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm/utilis/routs/routs_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashService {
  static splashvi() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var user = sp.getBool('islogin');
    print(user);

    if (user != null) {
      Timer(
        Duration(seconds: 6),
        () {
          Get.toNamed(RoutsName.homeview);
        },
      );
    } else {
      Timer(
        Duration(seconds: 6),
        () {
          Get.toNamed(RoutsName.loginview);
        },
      );
    }
  }
}
