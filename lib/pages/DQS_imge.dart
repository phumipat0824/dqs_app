import 'package:dqs_mobileapp/pages/DQS_create_qrcode.dart';
import 'package:dqs_mobileapp/pages/DQS_home.dart';
import 'package:dqs_mobileapp/pages/DQS_login.dart';
import 'package:dqs_mobileapp/pages/DQS_pdf.dart';
import 'package:dqs_mobileapp/pages/DQS_show_qrcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';

class DQS_imge extends StatefulWidget {
  const DQS_imge({Key? key}) : super(key: key);

  @override
  State<DQS_imge> createState() => _DQS_imgeState();
}

class _DQS_imgeState extends State<DQS_imge> {
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
                            Row(children: <Widget>[
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DQS_create_qrcode()),
                                  );
                                },
                                child: Text("เว็บไซต์"),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.blueGrey),
                                    textStyle: MaterialStateProperty.all(
                                        TextStyle(fontSize: 10))),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  if (txtUsername == null) {
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
                                child: Text("PDF"),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.blueGrey),
                                    textStyle: MaterialStateProperty.all(
                                        TextStyle(fontSize: 10))),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  if (txtUsername == null) {
                                    print('${txtUsername}');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const login_page()),
                                    );
                                  } else {
                                    print('${txtUsername}');
                                  }
                                },
                                child: Text("รูปภาพ"),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.blueGrey),
                                    textStyle: MaterialStateProperty.all(
                                        TextStyle(fontSize: 10))),
                              ),
                            ]),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['jpg'],
                                );
                                // FilePickerResult? result = await FilePicker.platform.pickFiles();
                                if (result == null) {
                                  print("No file selected");
                                } else {
                                  String? path = result.files.single.path;
                                  _upload(result, path);
                                  print(result.files.single.name);
                                  print(result.files.single.path);
                                }
                              },
                              child: Text("อัพโหลดรูปภาพ"),
                            ),
                            // SizedBox(height: 20),

                            // const ExpansionTile(
                            //   title: Text('เพิ่มโลโก้'),
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

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const login_page(),
      ),
    ],
  );
  void getUsername() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      txtUsername = pref.getString('username');
    });
  }
}

Future<void> setURL(textURL) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('url', textURL);
}

void _upload(FilePickerResult result, String? path) async {
  String fileName = result.files.single.name;
  String filePath = './' + result.files.single.name;

  FormData data = FormData.fromMap({
    "file": await MultipartFile.fromFile(
      path!,
      filename: fileName,
    ),
  });

  Dio dio = new Dio();
  dio
      .post("http://103.129.15.182/DQS/assets/user/DQS_api_upload.php",
          data: data)
      .then((response) => print(response))
      .catchError((error) => print(error));
}
