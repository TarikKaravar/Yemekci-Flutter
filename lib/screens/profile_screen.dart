import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56), // AppBar yüksekliği
        child: ClipRRect(
          child: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 240, 121, 2),
            title: const Text(
              'Her damak tadına uygun tarifler, her an elinizin altında.',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 240, 121, 2), // Turuncu
              Colors.white, // Beyaz
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
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
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
