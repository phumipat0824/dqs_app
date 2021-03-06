import 'package:dqs_mobileapp/pages/DQS_home.dart';
import 'package:dqs_mobileapp/pages/DQS_imge.dart';
import 'package:dqs_mobileapp/pages/DQS_login.dart';
import 'package:dqs_mobileapp/pages/DQS_pdf.dart';
import 'package:dqs_mobileapp/pages/DQS_show_qrcode.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';


class DQS_create_qrcode extends StatefulWidget {
  const DQS_create_qrcode({Key? key}) : super(key: key);

  @override
  State<DQS_create_qrcode> createState() => _DQS_create_qrcodeState();
}

class _DQS_create_qrcodeState extends State<DQS_create_qrcode> {
  TextEditingController url = TextEditingController();
  String? txtUsername = ' ';
  @override
  void initState() {
    super.initState();
    getUsername();
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
                      ElevatedButton.icon(
                        icon: Icon(
                          Icons.logout,
                          color: Color.fromARGB(255, 255, 255, 255),
                          size: 30.0,
                        ),
                        label: Text(''),
                        onPressed: () {
                                clearUser();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyApp()),
                                );
                              },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(237, 16, 5, 117)),
                          
                          padding: MaterialStateProperty.all(
                              EdgeInsets.fromLTRB(300, 10, 5, 10),
                              ),
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 16))
                        ),
                      ),
                      SizedBox(height: 40),
                      Image.network(
                        
                        'http://103.129.15.182/DQS/assets/image/logo_dqs.PNG',
                        width: 200,
                      ),
                      Text(
                        '????????????????????????????????????????????????',
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
                            Row(children: <Widget>[
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text("????????????????????????",style: TextStyle(color: Colors.black)),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 255, 208, 20)),
                                    textStyle: MaterialStateProperty.all(
                                        TextStyle(fontSize: 10,),)),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  if (txtUsername == ' ') {
                                    print('${txtUsername}');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const login_page()),
                                    );
                                  } else {
                                    print('${txtUsername}');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DQS_pdf()),
                                    );
                                  }
                                },
                                child: Text("PDF",style: TextStyle(color: Colors.black)),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 255, 208, 20)),
                                    textStyle: MaterialStateProperty.all(
                                        TextStyle(fontSize: 10,color: Colors.black),)),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  if (txtUsername == ' ') {
                                    print('${txtUsername}');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const login_page()),
                                    );
                                  } else {
                                    print('${txtUsername}');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DQS_imge()),
                                    );
                                  }
                                },
                                child: Text("??????????????????",style: TextStyle(color: Colors.black)),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 255, 208, 20)),
                                    textStyle: MaterialStateProperty.all(
                                        TextStyle(fontSize: 10,),)),
                              ),
                            ]),
                            SizedBox(height: 20),
                            Container(
                              width: 300.0,
                              child: TextField(
                                  controller: url,
                                  decoration: InputDecoration(
                                      labelText: '????????????????????????',
                                      border: OutlineInputBorder())),
                            ),
                            // SizedBox(height: 20),

                            // const ExpansionTile(
                            //   title: Text('??????????????????????????????'),
                            //   children: <Widget>[
                            //     ListTile(title: Text('......')),
                            //   ],
                            // ),

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
                              child: Text("????????????????????????????????????????????????"),
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

  void getUsername() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      txtUsername = pref.getString('username');
    });
  }
}
Future<void> clearUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('username', ' ');
  }
Future<void> setURL(textURL) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('url', textURL);
}
