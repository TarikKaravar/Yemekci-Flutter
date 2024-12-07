import 'package:flutter/material.dart';

import 'home_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
       
       child: Column(
  mainAxisAlignment: MainAxisAlignment.start, // Üst tarafa hizalar
  children: [
    Padding(
      padding: const EdgeInsets.only(top: 50.0), // Yukarı taşıma miktarı
      child: CircleAvatar(
        radius: 100, // Yuvarlak çerçeve boyutu
        backgroundImage: AssetImage('assets/images/pp.jpg'), // Resim yolu
        backgroundColor: Colors.black, // Arka plan rengi
      ),
    ),
    
    const SizedBox(height: 20),
    const Text(
      'Tarık Karavar',
      style: TextStyle(
        color: Colors.black,
        fontSize: 40,
      ),
    ),
const SizedBox(height: 20),
const Text(
      'Üye Numarası',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ),

    const SizedBox(height: 5),
const Text(
      '7874845656',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ),

    const SizedBox(height: 20),
const Text(
      'Eğitimler',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ),

    const SizedBox(height: 5),
const Text(
      '20+',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ),

    const SizedBox(height: 20),
const Text(
      'Yüklenen Tarifler',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ),

    const SizedBox(height: 5),
const Text(
      '50+',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ),


    const SizedBox(height: 20),
const Text(
      'Kaydedilenler',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ),

    const SizedBox(height: 5),
const Text(
      '100+',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ),




  ],
),



        


      ),

      

        bottomNavigationBar: BottomMenu(),

    );
  }
}