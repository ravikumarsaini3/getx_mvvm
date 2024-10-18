import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/view_model/getxcontroller/login_controller.dart';

class Customelevatedbutton extends StatelessWidget {
  final VoidCallback onpressed;

  final String title;
  const Customelevatedbutton({
    super.key,
    required this.onpressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    LoginController login = Get.put(LoginController());
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.height * 1;
    return SizedBox(
        height: height * 0.06,
        width: width * 0.6,
        child: Obx(
          () => ElevatedButton(
            onPressed: onpressed,
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                elevation: 5,
                animationDuration: const Duration(seconds: 1)),
            child: login.loading.value
                ? const CircularProgressIndicator()
                : Text(title),
          ),
        ));
  }
}
