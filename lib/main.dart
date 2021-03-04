import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:testflutterpackage/testflutterpackage.dart';
//import 'package:sobrepackage/sobrepackage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<String> _initPlatformState() async {
    String osVersion = "";

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      osVersion = "Android v${androidInfo.version.release}";
    }

    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      osVersion = "iOS v${iosDeviceInfo.systemVersion}";
    }

    return osVersion;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text(
                "Tela do app origem",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                child: Text(
                  "Chamar a tela do package",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  return Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CallURL().callURL(context),
                      ));
                },
              )
            ],
          ),
        ),
      ),
      // body: Center(
      //     child: FlatButton(
      //   child: Text("toque aqui"),
      //   onPressed: () {
      //     return CallURL().callURL(context);
      //     // return Sobre(
      //     //         "App RFB",
      //     //         "1.0",
      //     //         Image.network(
      //     //             'https://github.com/flutter/plugins/raw/master/packages/video_player/video_player/doc/demo_ipod.gif?raw=true'),
      //     //         "https://www.google.com.br",
      //     //         "iOS",
      //     //         "1.0",
      //     //         "DES")
      //     //     .showDialogSobre(context);
      //     // showDialog(
      //     //   context: context,
      //     //   builder: (BuildContext context) {
      //     //     // retorna um objeto do tipo Dialog
      //     //     return AlertDialog(
      //     //       title: new Text(_osVersion),
      //     //       content: new Text("Alert Dialog body"),
      //     //       actions: <Widget>[
      //     //         // define os botões na base do dialogo
      //     //         new FlatButton(
      //     //           child: new Text("Fechar"),
      //     //           onPressed: () {
      //     //             Navigator.of(context).pop();
      //     //           },
      //     //         ),
      //     //       ],
      //     //     );
      //     //   },
      //     // );
      //   },
    );
  }
}
