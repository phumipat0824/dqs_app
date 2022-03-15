import 'package:flutter/material.dart';
import 'package:dqs_app/pages/DQS_create_qrcode.dart';
import 'package:dqs_app/pages/DQS_login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(16, 5, 117, 35)),
      home: login_page(),
    );
  }
}
