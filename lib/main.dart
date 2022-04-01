import 'package:dqs_mobileapp/DQS_create_qrcode.dart';
import 'package:dqs_mobileapp/DQS_scan.dart';
import 'package:flutter/material.dart';
import 'package:dqs_mobileapp/DQS_create_qrcode.dart';
import 'package:dqs_mobileapp/DQS_login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp( home: Mainpage());
  }
}
class Mainpage extends StatefulWidget {
   int _currentIndex = 0;
   final tabs = [DQS_create_qrcode(), DQS_scan(), login_page()];

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int _currentIndex = 0;
  final tabs = [DQS_create_qrcode(), DQS_scan(), login_page()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "สร้างคิวอาร์โค้ด",
              backgroundColor: Colors.pink),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert_rounded),
            label: "สแกนคิวอาร์โค้ด",
            backgroundColor: Colors.pink,
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.add_alert_rounded),
            label: "เข้าสู่ระบบ",
            backgroundColor: Colors.pink,
          )
        ],
        onTap: (index) {
          setState(() {
            print(index);
            _currentIndex = index;
          });
        },
       
      ),
    );
  }
}
 
