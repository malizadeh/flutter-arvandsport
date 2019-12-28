import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter test'),
      ),
      body: Container(
        child: FloatingActionButton(
          onPressed: () {
            DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
            Future<AndroidDeviceInfo> androidInfo = deviceInfo.androidInfo;
            androidInfo.then((final x) {
              Fluttertoast.showToast(
                  timeInSecForIos: 2,
                  msg:
                      "Your Android Model: ${x.model}",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER);
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
