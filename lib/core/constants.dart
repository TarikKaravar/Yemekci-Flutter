import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const colors = {
  "primary": Color.fromARGB(255, 20, 79, 217),
  "secondary": Color.fromARGB(255, 255, 255, 255),
  "onPrimary": Color.fromARGB(255, 254, 153, 2),
  "onSecondary": Color.fromARGB(255, 0, 0, 0),
  "surface": Color.fromARGB(255, 255, 255, 255),
  "onSurface": Color.fromARGB(255, 123, 123, 123),
  "succes": Color.fromARGB(255, 83, 250, 0),
  "error": Color.fromARGB(255, 196, 3, 3),
  "onError":Colors.white,
};

const darkColors = {


  "primary": Color.fromARGB(255, 20, 79, 217),
  "secondary": Color.fromARGB(255, 255, 255, 255),
  "onPrimary": Color.fromARGB(255, 254, 153, 2),
  "onSecondary": Color.fromARGB(255, 0, 0, 0),
  "surface": Color.fromARGB(255, 255, 255, 255),
  "onSurface": Color.fromARGB(255, 255, 255, 255),
  "succes": Color.fromARGB(255, 83, 250, 0),
  "error": Color.fromARGB(255, 196, 3, 3),
  "onError":Colors.white,
};




final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: colors["primary"]!,
    onPrimary: colors["onPrimary"]!,
    secondary: colors["secondary"]!,
    onSecondary: colors["onSecondary"]!,
    error: colors["error"]!,
    onError: colors["onError"]!,
    surface: colors["surface"]!,
    onSurface: colors["onSurface"]!,

  ),

);


final darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    primary: darkColors["primary"]!,
    onPrimary: darkColors["onPrimary"]!,
    secondary: darkColors["secondary"]!,
    onSecondary: darkColors["onSecondary"]!,
    error: darkColors["error"]!,
    onError: darkColors["onError"]!,
    surface: darkColors["surface"]!,
    onSurface: darkColors["onSurface"]!,

  ),

);
