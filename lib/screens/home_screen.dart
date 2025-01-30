import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/core/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> featuredRecipes = [
    'assets/images/makarna.jpg',
    'assets/images/balık.jpg',
    'assets/images/burger.jpg',
    'assets/images/kızartma.jpg',
    'assets/images/Kebap.jpg',
  ];

  final List<String> bottomImages = [
    'assets/images/burcu.jpg',
    'assets/images/mustafa.jpg',
    'assets/images/ayşe.jpg',
    'assets/images/davet.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'Ana Sayfa',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    isDarkMode ? CupertinoIcons.sun_max : CupertinoIcons.moon,
                  ),
                  onPressed: () {
                    themeProvider.toggleTheme();
                  },
                ),
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(CupertinoIcons.search),
                  hintText: "Tarif Ara...",
                  filled: true,
                  fillColor: isDarkMode
                      ? Colors.grey[800]
                      : Colors.grey[200], 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSubmitted: (query) {
                  context.go("/search?query=$query");
                },
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        elevation: 0,
        child: Column(
          children: [
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Ana Sayfa'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.search),
              title: const Text('Örnek Tarifler'),
              onTap: () {
                context.go("/voice");
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.person),
              title: const Text('Profil'),
              onTap: () {
                context.go("/profile");
              },
            ),
            ListTile(
              leading:  const Icon(Icons.upload),
              title: const Text('Tarif Yükle'),
              onTap: () {
                context.go("/search");
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: false,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
              ),
              items: featuredRecipes.map((imagePath) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 16),

          
          GestureDetector(
            child: Container(
              width: 275,
              height: 180,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/tarif.jpg', 
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 150.0,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
              ),
              items: bottomImages.map((imagePath) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}

class BottomMenu extends StatelessWidget {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              context.go("/home");
            },
            icon: const Icon(CupertinoIcons.home),
          ),
          IconButton(
            onPressed: () {
              context.go("/voice");
            },
            icon: const Icon(CupertinoIcons.search),
          ),
          IconButton(
            onPressed: () {
              context.go("/search");
            },
            icon: const Icon(Icons.upload),
          ),
          IconButton(
            onPressed: () {
              context.go("/profile");
            },
            icon: const Icon(CupertinoIcons.person),
          ),
        ],
      ),
    );
  }
}
