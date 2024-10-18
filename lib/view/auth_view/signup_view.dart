import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/resourses/CustomButtons/button.dart';
import 'package:getx_mvvm/resourses/CustomButtons/textbutton.dart';
import 'package:getx_mvvm/utilis/routs/routs_name.dart';

import 'package:getx_mvvm/view_model/getxcontroller/signupcontroller.dart';

class Signupview extends StatefulWidget {
  const Signupview({super.key});

  @override
  State<Signupview> createState() => _SignupviewState();
}

class _SignupviewState extends State<Signupview> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print('object');
    var height = MediaQuery.of(context).size.height * 1;

    SignupController signupController = Get.put(SignupController());
    print('object');

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.03,
                  ),
                  const Center(
                    child: Text(
                      'Welcome New User ',
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  const Text(
                    'Signup',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  TextFormField(
                    controller: signupController.emailcontroller,
                    decoration: const InputDecoration(
                        labelText: 'email', hintText: 'enter your email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: height * 0.002,
                  ),
                  Obx(
                    () => TextFormField(
                      obscureText: signupController.obsuere.value,
                      controller: signupController.passworcontroller,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                signupController.changeobsucre();
                              },
                              icon: Icon(signupController.obsuere.value
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          labelText: 'password',
                          hintText: 'enter your password'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  Customelevatedbutton(
                      onpressed: () {
                        if (_formkey.currentState!.validate()) {
                          signupController.postsignupapi(context);
                        }
                      },
                      title: 'Login'),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('if you have already an account??  '),
                      customtextbutton(
                          onpressed: () {
                            Get.toNamed(RoutsName.loginview);
                          },
                          title: 'Login')
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
