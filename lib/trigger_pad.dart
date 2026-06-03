import 'package:flutter/material.dart';
import 'midi_manager.dart';

class TriggerPad extends StatelessWidget {
  final int note; // Número da nota MIDI (ex: 60 para C4)
  final String label;
  final MidiManager _midi = MidiManager();

  TriggerPad({required this.note, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _midi.sendCC(note, 127), // Nota ativada
      onTapUp: (_) => _midi.sendCC(note, 0),     // Nota desativada
      child: Container(
        width: 100, height: 100,
        color: Colors.redAccent,
        child: Center(child: Text(label, style: TextStyle(color: Colors.white))),
      ),
    );
  }
}
