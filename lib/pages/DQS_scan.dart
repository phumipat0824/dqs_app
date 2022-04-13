import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DQS_scanqrcode extends StatefulWidget {
  const DQS_scanqrcode({ Key? key }) : super(key: key);

  @override
  _DQS_scanqrcodeState createState() => _DQS_scanqrcodeState();
}

String qrData = "No data found!";
var data;
bool hasdata = false;

class _DQS_scanqrcodeState extends State<DQS_scanqrcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      backgroundColor: const Color.fromRGBO(16, 5, 117, 35),
        body: Container(
          width: double.infinity,
          child: Column(
            
            children: [
               SizedBox(height:80),
                      Image.network(
                        
                        'http://103.129.15.182/DQS/assets/image/logo_dqs.PNG',
                        width: 200,
                      ),
                      Text(
                        'สแกนคิวอาร์โค้ด',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                            fontSize: 29),
                      ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "ผลลัพธ์:  ${(qrData)}",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20,color: Colors.white),

                        ),
                      ),
                      SizedBox(height: 40,),
                      IconButton(
                        icon: Icon(Icons.launch_outlined,color: Colors.white,),
                        onPressed: hasdata
                            ? () async {
                                if (await canLaunch(qrData)) {
                                  print(qrData);
                                  await launch(qrData);
                                } else {
                                  throw 'Could not launch ';
                                }
                              }
                            : null,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                   
                    child : FloatingActionButton(
                     
                      shape: StadiumBorder(),
                      child: Icon(Icons.camera_alt_rounded,),
                      backgroundColor: Color.fromARGB(255, 250, 217, 1),
                      
                      onPressed: () async {
                        var options = ScanOptions(
                          //autoEnableFlash: false,
                          
                        );
                        var data = await BarcodeScanner.scan(options: options);
                        setState(() {
                          qrData = data.rawContent.toString();
                          hasdata = true;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      
    );
  }
}