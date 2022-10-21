// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({Key? key}) : super(key: key);

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  final TextEditingController emailTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    emailTextEditingController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailTextEditingController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              elevation: 10,
              backgroundColor: Colors.blue,
              titleTextStyle: TextStyle(color: Colors.blue),
              content: Text('password link has been send to your Email address',
                  style: TextStyle(color: Colors.white)),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Ok'))
              ],
            );
          });
    } on FirebaseException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.blue,
              title: Text(
                'ERROR!',
                style: TextStyle(),
              ),
              content: Text(
                'Email Invalid or Incorrect',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Ok'))
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'enter your email and we will send you a link to reset your password.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextFormField(
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
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: passwordReset,
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text('Reset Password'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
