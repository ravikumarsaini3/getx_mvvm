import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/appException/appexception.dart';
import 'package:getx_mvvm/data/splashservice/splash_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    animationController = AnimationController(
      duration: const Duration(seconds: 2), // Duration of the animation
      vsync: this,
    );

    // Create a Tween animation from 0.1 to 1.0
    animation =
        Tween<double>(begin: 0.1, end: 1.0).animate(animationController);
    animationController.forward();

    SplashService.splashvi();
  }

  @override
  void dispose() {
    animationController.dispose(); // Dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      body: Center(
        child: FadeTransition(
          opacity: animation, // Use the animation for opacity
          child: Text(
            'Splash Screen',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
