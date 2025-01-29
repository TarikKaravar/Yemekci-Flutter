import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';

import 'home_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Center(
          child: const Text(
            "Arama ekranım",
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
