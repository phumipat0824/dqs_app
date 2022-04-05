//import 'package:dqs_mobileapp/pages/DQS_qr.dart';
import 'package:dqs_mobileapp/pages/DQS_login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ร้านกล้วยหอมจอมเทียน',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final tabs = [login_page(), login_page(), login_page(), login_page()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แอพคำนวณ'),
        backgroundColor: Colors.green,
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Homepage",
            backgroundColor: Colors.green[900],
            activeIcon: Icon(
              Icons.home,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "CalculatePage",
            backgroundColor: Colors.green[900],
            activeIcon: Icon(
              Icons.calculate,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: "ContactPage",
            backgroundColor: Colors.green[900],
            activeIcon: Icon(
              Icons.contact_mail,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: "ContactPage",
            backgroundColor: Colors.green[900],
            activeIcon: Icon(
              Icons.contact_mail,
              color: Colors.white,
            ),
          )
        ],
        onTap: (index) {
          setState(() {
            print(index);
            _currentIndex = index;
          });
        },
      ),
      backgroundColor: Colors.yellow[300],
    );
  }
}
