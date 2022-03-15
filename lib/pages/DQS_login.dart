import 'package:flutter/material.dart';
import 'dart:html';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeArea(
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      Image.network(
                        'http://hippo-pi.com/DQS/assets/image/logo_dqs.PNG',
                        width: 100,
                      ),
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
                              child: TextField(
                                  // controller: username,
                                  decoration: InputDecoration(
                                      labelText: 'ชื่อผู้ใช้/อีเมล',
                                      border: UnderlineInputBorder())),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: 350.0,
                              child: TextField(
                                  // controller: username,
                                  decoration: InputDecoration(
                                      labelText: 'รหัสผ่าน',
                                      border: UnderlineInputBorder())),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  TextButton(
                                    child: const Text('ลืมรหัสผ่าน?'),
                                    onPressed: () {/* ... */},
                                  )
                                ]),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("เข้าสู่ระบบ"),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromRGBO(16, 5, 117, 35)),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.fromLTRB(140, 10, 140, 10)),
                                  textStyle: MaterialStateProperty.all(
                                      TextStyle(fontSize: 16))),
                            ),
                            SizedBox(height: 30),
                            Row(children: <Widget>[
                              Expanded(
                                child: new Container(
                                    margin: const EdgeInsets.only(
                                        left: 10.0, right: 20.0),
                                    child: Divider(
                                      color: Colors.black,
                                      height: 80,
                                    )),
                              ),
                              Text("หรือ"),
                              Expanded(
                                child: new Container(
                                    margin: const EdgeInsets.only(
                                        left: 20.0, right: 10.0),
                                    child: Divider(
                                      color: Colors.black,
                                      height: 80,
                                    )),
                              ),
                            ]),
                            //Divider(color: Colors.grey[300],),
                            SizedBox(height: 5),

                            SignInButton(
                              Buttons.Google,
                              text: "เข้าสู่ระบบด้วย Google",
                              onPressed: () {},
                            ),
                            // ElevatedButton(
                            //   onPressed: () {},
                            //   child: Text("เข้าสู่ระบบด้วย Google Account"),
                            //   style: ButtonStyle(
                            //       backgroundColor: MaterialStateProperty.all(
                            //           Color.fromRGBO(66, 133, 244, 35)),
                            //       padding: MaterialStateProperty.all(
                            //           EdgeInsets.fromLTRB(70, 20, 70, 20)),
                            //       textStyle: MaterialStateProperty.all(
                            //           TextStyle(fontSize: 16))),
                            // ),
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