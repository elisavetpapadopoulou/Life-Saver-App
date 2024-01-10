import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothScreen extends StatefulWidget {
  @override
  _BluetoothScreenState createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  bool _isBluetoothOn = false;

  @override
  void initState() {
    super.initState();
    _listenToBluetoothState();
  }

  void _listenToBluetoothState() {
    FlutterBluePlus.state.listen((state) {
      if (state == BluetoothState.on) {
        setState(() {
          _isBluetoothOn = true;
        });
      } else {
        setState(() {
          _isBluetoothOn = false;
        });
      }
    });
  }

  void _toggleBluetooth(bool value) async {
    if (value) {
      await FlutterBluePlus.startScan(timeout: Duration(seconds: 4));
      setState(() {
        _isBluetoothOn = true;
      });
    } else {
      await FlutterBluePlus.stopScan();
      setState(() {
        _isBluetoothOn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Bluetooth'),
              leading: Icon(Icons.bluetooth),
              trailing: Switch(
                value: _isBluetoothOn,
                onChanged: (value) {
                  _toggleBluetooth(value);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text('Track other devices'),
            ),
            // ... Additional Bluetooth options here ...
          ],
        ),
      ),
    );
  }
}
