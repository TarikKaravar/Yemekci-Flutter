import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:flutter_app/core/themes.dart';

import 'core/routes.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();  // Flutter widget'larını başlat
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter App',
      themeMode: ThemeMode.dark,
      theme:lightTheme ,

      darkTheme:darkTheme,
      routerConfig: router,  // go_router yapılandırmamızı kullan
      debugShowCheckedModeBanner: false,  // Debug bandını kaldır
    );
  }
}

