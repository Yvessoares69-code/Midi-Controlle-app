import 'package:flutter/material.dart';
import 'package:flutter_midi_command/flutter_midi_command.dart';

class MidiScanner extends StatefulWidget {
  @override
  _MidiScannerState createState() => _MidiScannerState();
}

class _MidiScannerState extends State<MidiScanner> {
  List<MidiDevice> _devices = [];

  @override
  void initState() {
    super.initState();
    _startScan();
  }

  void _startScan() async {
    var devices = await MidiCommand().devices;
    setState(() => _devices = devices);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _devices.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_devices[index].name, style: TextStyle(color: Colors.white)),
          onTap: () => MidiCommand().connectToDevice(_devices[index]),
        );
      },
    );
  }
}
