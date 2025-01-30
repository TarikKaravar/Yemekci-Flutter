import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:go_router/go_router.dart';

import 'home_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      body: Container(
        color: isDarkMode ? Colors.black : Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.account_circle, 
                size: 120, 
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  context.push("/login");
                },
                icon: const Icon(Icons.login, size: 24),
                label: const Text("Giriş Yapınız"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  backgroundColor: isDarkMode ? Colors.white : Colors.black,
                  foregroundColor: isDarkMode ? Colors.black : Colors.white,
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
