import 'package:flutter/material.dart';

import 'home_screen.dart';

class VoiceScreen extends StatelessWidget {
  const VoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("ses ekranım"),
      ),
      bottomNavigationBar: BottomMenu(),
    );  
  }
}