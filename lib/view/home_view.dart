import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/utilis/routs/routs_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setBool('islogin', false);
                Get.toNamed(RoutsName.loginview);
              },
              icon: Icon(
                Icons.logout_sharp,
                color: Colors.red,
              ))
        ],
      ),
      body: Center(
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Home View',
              style: TextStyle(color: Colors.green, fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
