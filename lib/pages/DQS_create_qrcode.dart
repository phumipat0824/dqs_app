import 'package:dqs_mobileapp/pages/DQS_show_qrcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DQS_create_qrcode extends StatefulWidget {
  const DQS_create_qrcode({Key? key}) : super(key: key);

  @override
  State<DQS_create_qrcode> createState() => _DQS_create_qrcodeState();
}

class _DQS_create_qrcodeState extends State<DQS_create_qrcode> {
  TextEditingController url = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 5, 117, 35),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeArea(
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 80),
                      Text(
                        'สร้างคิวอาร์โค้ด',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                            fontSize: 29),
                      ),
                      SizedBox(height: 20),
                      Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(height: 20),
                            Container(
                              width: 300.0,
                              child: TextField(
                                  controller: url,
                                  decoration: InputDecoration(
                                      labelText: 'เว็บไซต์',
                                      border: OutlineInputBorder())),
                            ),
                            SizedBox(height: 20),

                            const ExpansionTile(
                              title: Text('เพิ่มโลโก้'),
                              children: <Widget>[
                                ListTile(title: Text('......')),
                              ],
                            ),

                            SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () => setState(() {
                                var homeRounte = new MaterialPageRoute(
                                  builder: (BuildContext contex) =>
                                      DQS_show_qrcode(
                                    value_url: url.text,
                                  ),
                                );
                                Navigator.of(context).push(homeRounte);
                              }),
                              child: Text("สร้างคิวอาร์โค้ด"),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromRGBO(16, 5, 117, 35)),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.fromLTRB(50, 20, 50, 20)),
                                  textStyle: MaterialStateProperty.all(
                                      TextStyle(fontSize: 16))),
                            ),

                            //Divider(color: Colors.grey[300],),
                            SizedBox(height: 5),

                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> setURL(textURL) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('url', textURL);
}
