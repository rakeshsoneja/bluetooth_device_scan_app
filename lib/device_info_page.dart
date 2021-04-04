import 'package:flutter/material.dart';

class DeviceInfoPage extends StatelessWidget {

  final deviceName;
  final deviceID;

  DeviceInfoPage({this.deviceName, this.deviceID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Device Info'),
      ),
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.teal[50],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text('Device Name',),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.teal[50],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text('$deviceName',),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.teal[50],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text('Device ID',),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.teal[50],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text('$deviceID'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}