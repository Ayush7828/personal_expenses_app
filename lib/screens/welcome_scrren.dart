import 'package:flutter/material.dart';
import 'package:persnalexpenses_app/utils/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              FittedBox(
                child: Image(
                  image: const AssetImage("assets/images/welcome_gif.gif"),
                  width: MediaQuery.of(context).size.width,
                  
                  height: MediaQuery.of(context).size.height * 0.96,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(30),
                alignment: Alignment.topCenter,
                child: const Text(
                  "Welcome",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0),
                ),
              ),
              Positioned(
                right: 15,
                bottom: 15,
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, MyRoutes.signup),
                  child: FittedBox(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 50.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50.0)),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 15,
                bottom: 15,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, MyRoutes.login);
                  },
                  child: FittedBox(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 50.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
