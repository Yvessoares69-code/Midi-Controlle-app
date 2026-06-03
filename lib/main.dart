import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            'Controlador MIDI',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
// No seu main.dart
FaderControl(ccNumber: 7, label: "Volume"),
// Adicione isto no seu main.dart (dentro do Scaffold)
body: Padding(
  padding: const EdgeInsets.all(20.0),
  child: Wrap(
    spacing: 20.0, // Espaço entre os faders
    runSpacing: 20.0,
    children: [
      FaderControl(ccNumber: 7, label: "Volume A"),
      FaderControl(ccNumber: 8, label: "Volume B"),
      FaderControl(ccNumber: 9, label: "Master"),
    ],
  ),
),
