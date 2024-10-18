import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/resourses/CustomButtons/button.dart';
import 'package:getx_mvvm/resourses/CustomButtons/textbutton.dart';
import 'package:getx_mvvm/utilis/routs/routs_name.dart';
import 'package:getx_mvvm/view_model/getxcontroller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print('object');
    var height = MediaQuery.of(context).size.height * 1;

    LoginController loginController = Get.put(LoginController());
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
                      'Welcome Back ',
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  const Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  TextFormField(
                    controller: loginController.emailcontroller,
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
                      obscureText: loginController.obsuere.value,
                      controller: loginController.passworcontroller,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                loginController.changeobsucre();
                              },
                              icon: Icon(loginController.obsuere.value
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
                      // loading: loginController.loading.value,
                      onpressed: () {
                        if (_formkey.currentState!.validate()) {
                          loginController.postapi(context);
                        }
                      },
                      title: 'Login'),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('if you dont have any account??  '),
                      customtextbutton(
                          onpressed: () {
                            Get.toNamed(RoutsName.signupview);
                          },
                          title: 'Signup')
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
