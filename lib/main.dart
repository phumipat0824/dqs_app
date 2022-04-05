import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';

void main() {
  runApp(
    MaterialApp(
      home: FilePickerApp(),
    ),
  );
}

class FilePickerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is for only tut perpose"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['pdf'],
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
          child: Text("File Picker"),
        ),
      ),
    );
  }
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
