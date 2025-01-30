import 'package:flutter/material.dart';
import 'home_screen.dart';

class VoiceScreen extends StatelessWidget {
  const VoiceScreen({super.key});

  final List<Map<String, String>> recipes = const [
    {"image": "assets/images/krep.jpg", "name": "Krep"},
    {"image": "assets/images/Kebap.jpg", "name": "Kebap"},
    {"image": "assets/images/balık.jpg", "name": "Balık"},
    {"image": "assets/images/kızartma.jpg", "name": "Kızartma"},
    {"image": "assets/images/makarna.jpg", "name": "Makarna"},
    {"image": "assets/images/burger.jpg", "name": "Burger"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Örnek Tarifler"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0, 
            mainAxisSpacing: 20.0, 
            childAspectRatio: 0.8, 
          ),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Image.asset(
                        recipes[index]["image"]!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  recipes[index]["name"]!,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
