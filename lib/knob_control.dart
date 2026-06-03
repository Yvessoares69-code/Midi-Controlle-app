import 'package:flutter/material.dart';
import 'midi_manager.dart';

class KnobControl extends StatefulWidget {
  final int ccNumber;
  final String label;

  KnobControl({required this.ccNumber, required this.label});

  @override
  _KnobControlState createState() => _KnobControlState();
}

class _KnobControlState extends State<KnobControl> {
  double _value = 0.0;
  final MidiManager _midi = MidiManager();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        setState(() {
          // Ajusta a sensibilidade do knob (quanto arrastar)
          _value = (_value - details.delta.dy * 0.5).clamp(0.0, 127.0);
        });
        _midi.sendCC(widget.ccNumber, _value.toInt());
      },
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[850],
              border: Border.all(color: Colors.amber, width: 2),
            ),
            child: Center(
              child: Text(
                _value.toInt().toString(),
                style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(widget.label, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
