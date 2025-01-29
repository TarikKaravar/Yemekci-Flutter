import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:go_router/go_router.dart';

import 'home_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.push("/login");
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          child: const Text("Giriş Yapınız"),
        ),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
