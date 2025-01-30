import 'package:flutter/material.dart';
import 'home_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tarif Yükleme Ekranı",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground, 
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true, 
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              // Butona tıklanınca yapılacak işlem
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Tarif Yükle",
              style: TextStyle(
                fontWeight: FontWeight.bold, // Kalın yazı stili
                fontSize: 16, // Yazı boyutu
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
