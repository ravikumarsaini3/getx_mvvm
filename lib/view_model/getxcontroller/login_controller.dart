import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_mvvm/data/networkapi/network_service.dart';
import 'package:getx_mvvm/resourses/appurl/appurl.dart';
import 'package:getx_mvvm/utilis/routs/routs_name.dart';
import 'package:getx_mvvm/utilis/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  NetworkService networkService = NetworkService();
  var emailcontroller = TextEditingController();
  var passworcontroller = TextEditingController();

  RxBool obsuere = false.obs;
  RxBool loading = false.obs;
  setloading(bool value) {
    loading.value = value;
  }

  changeobsucre() {
    obsuere.value = !obsuere.value;
  }

  Future postapi(context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setloading(true);
    Map<String, String> data = {
      'email': emailcontroller.text,
      'password': passworcontroller.text,
    };
    try {
      var respnce = await networkService.postloginapi(data, Appurl.loginurl);
      if (respnce != null) {
        sp.setBool('islogin', true);
        Utils.showFlushbar(context, 'Successfully ', 'Login');
        Get.toNamed(RoutsName.homeview);
        setloading(false);
      }
    } catch (e) {
      setloading(false);
      Utils.showFlushbar(context, 'Error ', e.toString());
    }
  }
}
