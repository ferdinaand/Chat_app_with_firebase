// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:string_chat/modal/user.dart';
import 'package:string_chat/views/sign_in.dart';
import 'package:string_chat/views/sign_up.dart';

class AuthMethods {
  Future signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: '', password: '');
  }
}
