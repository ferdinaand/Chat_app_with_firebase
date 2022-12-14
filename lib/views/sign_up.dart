// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:string_chat/views/sign_in.dart';
import 'package:string_chat/widgets/widget.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    emailTextEditingController.dispose();
    // ignore: todo
    passwordTextEditingController.dispose();

    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextEditingController.text.trim(),
          password: passwordTextEditingController.text.trim());
    }
  }

  bool passwordConfirmed() {
    if (passwordTextEditingController == confirmPasswordController) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(color: Colors.white),
            height: MediaQuery.of(context).size.height - 50,
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Image.asset(
                      'assets/images/group.png',
                      height: 130,
                      width: 130,
                    ),
                  ),
                  TextFormField(
                    controller: emailTextEditingController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 227, 241, 253),
                        labelText: "email",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 227, 241, 253)),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(
                          Icons.email_rounded,
                          color: Color.fromARGB(255, 5, 170, 246),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passwordTextEditingController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 227, 241, 253),
                      labelText: "password",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 227, 241, 253)),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      prefixIcon: Icon(
                        Icons.key,
                        color: Color.fromARGB(255, 5, 170, 246),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 227, 241, 253),
                      labelText: "Confirm password",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 227, 241, 253)),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      prefixIcon: Icon(
                        Icons.key,
                        color: Color.fromARGB(255, 5, 170, 246),
                      ),
                    ),
                  ),
                  SizedBox(height: 14),

                  //Elevated buttons
                  ElevatedButton(
                    onPressed: signUp,
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(350, 55),
                        primary: Color.fromARGB(255, 35, 150, 238),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 15),
                      ),
                      TextButton(
                        style: ButtonStyle(
                            enableFeedback: true,
                            splashFactory: NoSplash.splashFactory),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return signIn();
                          }));
                        },
                        child: Text(
                          'sign in',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'OR',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      divider(),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Color.fromARGB(255, 199, 229, 255),
                              ),
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            "assets/images/facebook_f.svg",
                            height: 25,
                            width: 25,
                            color: Color.fromARGB(255, 0, 76, 138),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Color.fromARGB(255, 199, 229, 255),
                              ),
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            "assets/images/google_plus.svg",
                            height: 30,
                            width: 30,
                            color: Color.fromARGB(255, 152, 13, 3),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Color.fromARGB(255, 199, 229, 255),
                              ),
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            "assets/images/twitter.svg",
                            height: 30,
                            width: 30,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class divider extends StatelessWidget {
  const divider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: const Divider(
        thickness: .5,
        color: Colors.blue,
      ),
    );
  }
}
