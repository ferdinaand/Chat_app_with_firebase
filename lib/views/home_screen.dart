import 'dart:developer';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:string_chat/views/chat_screens.dart';
import 'package:string_chat/services/Auth.dart';
import 'package:string_chat/views/sign_up.dart';
import 'package:string_chat/views/sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  Future signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(
        Icons.chat_bubble,
        size: 25,
      ),
      const Icon(
        Icons.call_rounded,
        size: 25,
      ),
      const Icon(
        Icons.settings,
        size: 25,
      ),
      const Icon(
        Icons.account_box,
        size: 25,
      )
    ];
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text('signed in as')),
            ElevatedButton(
                onPressed: signout,
                child: const Text(
                  'signout',
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        items: items,
        animationDuration: Duration(milliseconds: 250),
        onTap: (index) {},
      ),
    );
  }
}
