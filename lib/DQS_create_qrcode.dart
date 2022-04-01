import 'package:dqs_mobileapp/DQS_scan.dart';
import 'package:flutter/material.dart';
import 'package:dqs_mobileapp/DQS_login.dart';
import 'package:dqs_mobileapp/DQS_show_qrcode.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DQS_create_qrcode extends StatefulWidget {
  //const DQS_create_qrcode({ Key? key }) : super(key: key);
  int _currentIndex = 0;
  final tabs = [DQS_create_qrcode() ,DQS_scan(),login_page()];

  @override
  State<DQS_create_qrcode> createState() => _DQS_create_qrcodeState();
}

class _DQS_create_qrcodeState extends State<DQS_create_qrcode> {
  TextEditingController url = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SafeArea(
                  child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'Document QR',
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
                                  width: 350.0,
                                  height: 60,
                                  child: TextField(
                                      controller: url,
                                      decoration: InputDecoration(
                                          labelText: 'เว็บไซต์',
                                          border: OutlineInputBorder())),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height: 10.0),
                                      ExpansionTile(
                                        title: Text(
                                          "เพิ่มโลโก้",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        children: <Widget>[
                                          ListTile(
                                            title: Text('ใส่ LOgo ด้วยนะ'),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () => setState(() {
                                    var homeRounte = new MaterialPageRoute(
                                      builder: (BuildContext contex) => DQS_show_qrcode(
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
        ],
      ),
    );
  }
}

Future<void> setURL(textURL) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('url', textURL);
}
