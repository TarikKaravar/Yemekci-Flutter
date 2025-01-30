import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( // Ortalamak için Center kullanıldı
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 200, // Logoyu büyüttüm
              height: 200,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/logo.webp',
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 30), // Boşluk artırıldı

            InkWell(
              onTap: () => context.go("/home"),
              child: SizedBox(
                width: 150,
                child: DotLottieLoader.fromAsset(
                  "assets/motions/loading1.lottie",
                  frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                    if (dotlottie != null) {
                      return Lottie.memory(dotlottie.animations.values.single);
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
