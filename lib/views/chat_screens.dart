// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class chatScreen extends StatefulWidget {
  chatScreen({Key? key}) : super(key: key);

  @override
  State<chatScreen> createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.arrow_left),
            label: Text('hello')),
      ),
    );
  }
}
