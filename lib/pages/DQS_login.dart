import 'dart:convert';
import 'package:dqs_mobileapp/main.dart';
import 'package:dqs_mobileapp/pages/DQS_create_qrcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  List userdata = [];
  void initState() {
    super.initState();
    getUers();
  }

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
                      Image.network(
                        'https://cdn-icons-png.flaticon.com/512/295/295128.png',
                        //'http://103.129.15.182/DQS/assets/image/logo_dqs.PNG',
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
                                  controller: username,
                                  decoration: InputDecoration(
                                      labelText: '??????????????????????????????/???????????????',
                                      border: UnderlineInputBorder())),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: 350.0,
                              child: TextField(
                                  obscureText: true,
                                  controller: password,
                                  decoration: InputDecoration(
                                      labelText: '????????????????????????',
                                      border: UnderlineInputBorder())),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  TextButton(
                                    child: const Text('??????????????????????????????????'),
                                    onPressed: () {/* ... */},
                                  )
                                ]),
                            ElevatedButton(
                              onPressed: () {
                                print('-----------');
                                print('username: ${username.text}');
                                print('password: ${password.text}');
                                getUers();
                                if (checkLogin(username.text, password.text)) {
                                  setUsername(username.text);
                                  Fluttertoast.showToast(
                                      msg: "???????????????????????????????????????????????????!",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor:
                                          Color.fromARGB(255, 0, 255, 13),
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  //   Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => const DQS_scan()),
                                  // );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MyApp()),
                                  );
                                } else {
                                  // print('worng');
                                  Fluttertoast.showToast(
                                      msg: "???????????????????????????????????????????????????????????????????????????!",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                                // print('userdata : ${userdata.length}');

                                // Fluttertoast.showToast(
                                //     msg: "Login Successfully!",
                                //     toastLength: Toast.LENGTH_SHORT,
                                //     gravity: ToastGravity.CENTER,
                                //     timeInSecForIosWeb: 1,
                                //     backgroundColor: Colors.red,
                                //     textColor: Colors.white,
                                //     fontSize: 16.0);
                              },
                              child: Text("?????????????????????????????????"),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromRGBO(16, 5, 117, 35)),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.fromLTRB(140, 10, 140, 10)),
                                  textStyle: MaterialStateProperty.all(
                                      TextStyle(fontSize: 16))),
                            ),
                            SizedBox(height: 30),
                            // Row(children: <Widget>[
                            //   Expanded(
                            //     child: new Container(
                            //         margin: const EdgeInsets.only(
                            //             left: 10.0, right: 20.0),
                            //         child: Divider(
                            //           color: Colors.black,
                            //           height: 80,
                            //         )),
                            //   ),
                            //   Text("????????????"),
                            //   Expanded(
                            //     child: new Container(
                            //         margin: const EdgeInsets.only(
                            //             left: 20.0, right: 10.0),
                            //         child: Divider(
                            //           color: Colors.black,
                            //           height: 80,
                            //         )),
                            //   ),
                            // ]),
                            // //Divider(color: Colors.grey[300],),
                            // SizedBox(height: 5),

                            // SignInButton(
                            //   Buttons.Google,
                            //   text: "????????????????????????????????????????????? Google",
                            //   onPressed: () {},
                            // ),
                            // ElevatedButton(
                            //   onPressed: () {},
                            //   child: Text("????????????????????????????????????????????? Google Account"),
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

  getUers() async {
    var url = Uri.parse('http://103.129.15.182/DQS/index.php/Api_test/Api');
    var response = await http.get(url);
    var result = utf8.decode(response.bodyBytes);
    // print(result);
    setState(() {
      userdata = jsonDecode(result);
    });
  }

  checkLogin(String username, String password) {
    var hashpass = md5.convert(utf8.encode(password)).toString();
    // print(username);
    // print(password);
    // print(hashpass);
    // print(userdata.length);
    for (var i = 0; i < userdata.length; i++) {
      if ((username == userdata[i]['mem_username'] ||
              username == userdata[i]['mem_email']) &&
          hashpass == userdata[i]['mem_password']) {
        // print('yes');
        return true;
      }
    }
    return false;
  }

  Future<void> setUsername(textUsername) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('username', textUsername);
  }
}
