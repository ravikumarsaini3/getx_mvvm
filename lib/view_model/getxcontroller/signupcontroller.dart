import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/networkapi/network_service.dart';
import 'package:getx_mvvm/resourses/appurl/appurl.dart';
import 'package:getx_mvvm/utilis/routs/routs_name.dart';
import 'package:getx_mvvm/utilis/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupController extends GetxController {
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

  Future postsignupapi(context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setloading(true);
    Map<String, String> data = {
      'email': emailcontroller.text,
      'password': passworcontroller.text,
    };
    try {
      var responce = await networkService.postsignupapi(data, Appurl.signupurl);
      if (responce != null) {
        sp.setBool('islogin', true);
        Utils.showFlushbar(
            context, 'Register Successfull ', 'Your account have been created');

        Get.toNamed(RoutsName.homeview);
      }
    } catch (e) {
      setloading(false);
      Utils.showFlushbar(context, 'Error ', e.toString());
    }
  }
}
