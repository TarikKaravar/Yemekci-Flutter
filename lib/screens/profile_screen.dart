import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Text("Sayfalar Arası Geçiiş"),
          ElevatedButton(
            onPressed: () {
              context.push("/login");
            }, 
            child: const Text("Giriş Yapınız"),
          ),
        ],
      ), // List View
      bottomNavigationBar: BottomMenu(),
    ); // Scaffold
  }
}