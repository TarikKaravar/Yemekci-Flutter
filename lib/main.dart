import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme_provider.dart';
import 'package:flutter_app/screens/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/core/themes.dart';
import 'core/routes.dart';
import 'theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
      title: 'Flutter App',
      themeMode: themeProvider.themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
