import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothScreen extends StatefulWidget {
  @override
  _BluetoothScreenState createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  bool _bluetoothEnabled = false;

  @override
  void initState() {
    super.initState();
    _getBluetoothState();
  }

  void _getBluetoothState() async {
    _bluetoothEnabled = await FlutterBluetoothSerial.instance.isEnabled;
    setState(() {});
  }

  void _toggleBluetooth(bool value) async {
    if (value) {
      await FlutterBluetoothSerial.instance.requestEnable();
    } else {
      await FlutterBluetoothSerial.instance.requestDisable();
    }

    _getBluetoothState();
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
            SwitchListTile(
              title: Text('Bluetooth'),
              subtitle: Text('Track other devices'),
              value: _bluetoothEnabled,
              onChanged: _toggleBluetooth,
              secondary: Icon(Icons.bluetooth),
            ),
          ],
        ),
      ),
    );
  }
}
