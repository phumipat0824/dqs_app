import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Stack(
                children: <Widget>[
                  // Stroked text as border.
                  Text(
                    'ร้านกล้วยหอมจอมเทียน',
                    style: TextStyle(
                      fontSize: 45,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Colors.grey[900]!,
                    ),
                  ),
                  // Solid text as fill.
                  Text(
                    'ร้านกล้วยหอมจอมเทียน',
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.yellow[700],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 30,
              ),
              const Text(
                'โปรแกรมคำนวนราคากล้วยที่ใช้งานง่ายที่สุดในโลก',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Text(
                'เพียงระบุจำนวนกล้วย และราคา จากนั้นกดปุ่มคำนวณเพื่อหาราคาที่คุณต้องจ่าย',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        )
      ],
    );
  }
}
