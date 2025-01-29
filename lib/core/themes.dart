import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



final lightTheme = ThemeData (
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: GoogleFonts.latoTextTheme(),
);

final darkTheme= ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: GoogleFonts.latoTextTheme(),
);