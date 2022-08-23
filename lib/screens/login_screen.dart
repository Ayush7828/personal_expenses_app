import 'dart:io';

import 'package:flutter/material.dart';
import 'package:persnalexpenses_app/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool button = false;
  final _formkey = GlobalKey<FormState>();
  movetonext(BuildContext context) {
    if (_formkey.currentState!.validate()) {
      Navigator.pushNamed(context, MyRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffE5E5E5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topCenter,
                child: const Text(
                  "Welcome Expenses App",
                  style: TextStyle(
                      fontFamily: "Quicksand",
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 75.0,
              ),
              Container(
                padding: const EdgeInsets.only(left: 12.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      fontSize: 25.0),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Email or Phone-Number";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Email Address / Mobile number",
                          labelStyle: const TextStyle(
                              fontFamily: "Poppins", color: Color(0xff2E2E2E)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              // width: 1,
                              color: Color(0xffFFFFFF),
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xffFFFFFF),
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Write Password";
                          } else if (value.length <= 6) {
                            return "Please write minimum 7";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: const TextStyle(
                              fontFamily: "Poppins", color: Color(0xff2E2E2E)),
                          suffixIcon: const Icon(
                            Icons.visibility,
                            color: Color(0xff2F3030),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              // width: 1,
                              color: Color(0xffFFFFFF),
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              // width: 1,
                              color: Color(0xffFFFFFF),
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700,
                              color: Color(0xff2F3030)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => movetonext(context),
                // Navigator.pushNamed(context, MyRoutes.home);

                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff7885D4),
                            Color(0xff414FA2),
                          ]),
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Login Now",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0),
                      ),
                      Icon(
                        Icons.arrow_right_alt_sharp,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.signup);
                },
                child: const InkWell(
                  child: Text(
                    "Create An Account",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
