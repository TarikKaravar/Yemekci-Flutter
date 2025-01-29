import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isAnimationVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'Ana Sayfa',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(CupertinoIcons.app, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        elevation: 0,
        child: Column(
          children: [
            const SizedBox(height: 16), // Boşluk
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Ana Sayfa'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.search),
              title: const Text('Geçmiş'),
              onTap: () {
                Navigator.pop(context);
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
              leading: const Icon(CupertinoIcons.settings),
              title: const Text('Ayarlar'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          
        ),
        child: Column(
          children: [
            if (_isAnimationVisible)
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: DotLottieLoader.fromAsset(
                      "assets/motions/deneme2.lottie",
                      frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                        if (dotlottie != null) {
                          return Lottie.memory(
                            dotlottie.animations.values.single,
                            repeat: false,
                            onLoaded: (composition) {
                              Future.delayed(
                                composition.duration,
                                () {
                                  setState(() {
                                    _isAnimationVisible = false;
                                  });
                                },
                              );
                            },
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      "body smal txt",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      "Heading 2",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      "Heading 3",
                      style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    Text(
                      "Heading 4",
                      style: Theme.of(context).textTheme.displaySmall,
                      ),
                 ]
                )
              )
          ],
        ),
      ),
      
      bottomNavigationBar: const BottomMenu(),
    );
  }
}

class BottomMenu extends StatelessWidget {
  const BottomMenu({
    super.key,
  });

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
            icon: const Icon(
              CupertinoIcons.home,
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/search");
            },
            icon: const Icon(
              CupertinoIcons.search,
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/voice");
            },
            icon: const Icon(
              Icons.voice_chat,
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/profile");
            },
            icon: const Icon(
              CupertinoIcons.person,
            ),
          ),
        ],
      ),
    );
  }
}
