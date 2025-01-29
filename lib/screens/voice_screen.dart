import 'package:flutter/material.dart';

import 'home_screen.dart';

class VoiceScreen extends StatelessWidget {
  const VoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: const Text(
            "Ses ekranım",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
