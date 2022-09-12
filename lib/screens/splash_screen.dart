// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:persnalexpenses_app/screens/welcome_scrren.dart';

class SplashScrren extends StatefulWidget {
  const SplashScrren({super.key});

  @override
  State<SplashScrren> createState() => _SplashScrrenState();
}

class _SplashScrrenState extends State<SplashScrren> {
  @override
  void initState() {
    super.initState();
    _navigator();
  }

  _navigator() async {
    await Future.delayed(const Duration(seconds: 5), () {});
   
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen(),),);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Center(
                child: Image.asset(
                  "assets/images/welcome1.gif",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            const CircularProgressIndicator(
              color: Color.fromARGB(255, 167, 113, 109),
            )
          ],
        ),
      ),
    );
  }
}
