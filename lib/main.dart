import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'device_info_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BluetoothDevicesPage(),
    );
  }
}

class BluetoothDevicesPage extends StatefulWidget {


  BluetoothDevicesPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _BluetoothDevicesPageState createState() => _BluetoothDevicesPageState();
}

class _BluetoothDevicesPageState extends State<BluetoothDevicesPage> {
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  List<GestureDetector> scannedDevices = <GestureDetector>[];
  List<GestureDetector> displayScannedDevices = <GestureDetector>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    flutterBlue.scanResults.listen((List<ScanResult> scannedList) {
      scannedDevices = [];
        for(ScanResult result in scannedList) {
          scannedDevices.add(
              GestureDetector(
                onTap: () {
                  var deviceID = result.device.id;
                  var deviceName = result.device.name;
                  print('Click Happened $deviceID');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DeviceInfoPage(
                      deviceName: deviceName,
                      deviceID: deviceID,
                    ),
                    ),
                  );
                },
                child: Card(
                  // margin: EdgeInsets.all(5.0),
                  color: Colors.teal[50],
                  child: ListTile(

                    leading: Icon(
                      Icons.devices,
                      color: Colors.teal.shade800,
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.teal.shade800,
                    ),
                    title: Text(
                      result.device.name
                    )
                  ),
                ),
              )
            );
          // });

        }

        setState(() {
          displayScannedDevices = scannedDevices;
        });
    });
    flutterBlue.startScan(timeout: Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Devices'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 10,
              child: ListView(
                children: displayScannedDevices
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    displayScannedDevices = [];
                  });
                  flutterBlue.startScan(timeout: Duration(seconds: 10));
                },
                child: Container(
                  child: Center(
                    child:
                      Text('Refresh Device List', style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 10.0),
                  height: 30,
                  color: Colors.lightBlue,
                ),
              ),

            ),
          ],

        ),
      ),
    );
  }
}
