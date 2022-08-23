import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../utils/routes.dart';

class SignupScrren extends StatefulWidget {
  const SignupScrren({super.key});

  @override
  State<SignupScrren> createState() => _SignupScrrenState();
}

class _SignupScrrenState extends State<SignupScrren> {
  my_card(icons, text) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter First Name ";
        }
        return null;
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
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
        labelText: text,
        prefixIcon: Icon(icons),
        labelStyle: const TextStyle(
          fontFamily: "Popppins",
          fontSize: 13.0,
          color: Color(0XFFADA4A5),
        ),
      ),
    );
  }

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
          child: Column(children: [
            const SizedBox(
              height: 12.0,
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              alignment: Alignment.topCenter,
              child: const Text(
                "Create An Account",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    fontSize: 24.0),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    my_card(CupertinoIcons.person, 'First Name'),
                    const SizedBox(
                      height: 15,
                    ),
                    my_card(CupertinoIcons.person, 'Last Name'),
                    const SizedBox(
                      height: 15,
                    ),
                    my_card(CupertinoIcons.mail, 'Email'),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter a Password";
                        } else if (value.length <= 7) {
                          return "Minimum 7 numbers";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
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
                        labelText: 'PassWord',
                        prefixIcon: const Icon(
                          CupertinoIcons.lock,
                        ),
                        suffixIcon: const Icon(Icons.visibility_off_outlined),
                        labelStyle: const TextStyle(
                          fontFamily: "Popppins",
                          fontSize: 13.0,
                          color: Color(0XFFADA4A5),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    my_card(CupertinoIcons.phone, 'Phone Number'),
                    const SizedBox(
                      height: 15,
                    ),
                    my_card(CupertinoIcons.share, 'Refferal Code'),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () => movetonext(context),
                      //  Navigator.pushNamed(context, MyRoutes.home);

                      child: Container(
                        alignment: Alignment.topCenter,
                        width: double.infinity,
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xff7885D4),
                                  Color(0xff414FA2),
                                ]),
                            borderRadius: BorderRadius.circular(50.0)),
                        child: const Text(
                          "Register",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
