import 'package:flutter/material.dart';

import 'home_screen.dart';

class VoiceScreen extends StatelessWidget {
  const VoiceScreen({super.key});

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
            crossAxisCount: 1,
            crossAxisSpacing: 20.0, 
            mainAxisSpacing: 20.0, 
            childAspectRatio: 0.8, 
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          width: 2,
                        ),
                      ),
                      child: index == 0
                          ? const Image(
                              image: AssetImage("assets/images/krep.jpg"), 
                              fit: BoxFit.cover,
                            )
                          : index == 1
                              ? const Image(
                                  image: AssetImage("assets/images/Kebap.jpg"),
                                  fit: BoxFit.cover,
                                )
                          : index == 2
                              ? const Image(
                                  image: AssetImage("assets/images/balık.jpg"),
                                  fit: BoxFit.cover,
                                )

                          : index == 3
                              ? const Image(
                                  image: AssetImage("assets/images/kızartma.jpg"),
                                  fit: BoxFit.cover,
                                )

                          : index == 4
                              ? const Image(
                                  image: AssetImage("assets/images/makarna.jpg"),
                                  fit: BoxFit.cover,
                                )

                          : index == 5
                              ? const Image(
                                  image: AssetImage("assets/images/burger.jpg"),
                                  fit: BoxFit.cover,
                                )

                          
                          
                              : const Center(
                                  child: Icon(
                                    Icons.image,
                                    size: 45,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Krep",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}