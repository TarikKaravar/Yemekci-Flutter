import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:google_fonts/google_fonts.dart';


final lightTheme = ThemeData (
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: GoogleFonts.latoTextTheme().copyWith(
    titleSmall: GoogleFonts.lato(
      textStyle: TextStyle(
        color: colors["onSurface"]
      )
    )
  ),
);

final darkTheme= ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: GoogleFonts.latoTextTheme().copyWith(
    titleSmall: GoogleFonts.lato(
      textStyle: TextStyle(
        color: darkColors["onSurface"]
      )
    ),

    titleMedium: GoogleFonts.lato(
      textStyle: TextStyle(
        color: darkColors["onSurface"]
      )
    ),


    titleLarge: GoogleFonts.lato(
      textStyle: TextStyle(
        color: darkColors["onSurface"]
      )
    ),

    bodySmall: GoogleFonts.lato(
      textStyle: TextStyle(
        color: darkColors["onSurface"],
      )
    ),

    bodyMedium: GoogleFonts.lato(
      textStyle: TextStyle(
        color: darkColors["onSurface"],
      )
    ),

    bodyLarge: GoogleFonts.lato(
      textStyle: TextStyle(
        color: darkColors["onSurface"],
      )
    ),

    headlineSmall: GoogleFonts.lato(
      textStyle: TextStyle(
        color: darkColors["onSurface"],
      )
    ),

    displaySmall: GoogleFonts.lato(
      textStyle: TextStyle(
        color: darkColors["onSurface"],
      )
    ),

    displayMedium: GoogleFonts.lato(
      textStyle: TextStyle(
        color: darkColors["onSurface"],
      )
    ),

    displayLarge: GoogleFonts.lato(
      textStyle: TextStyle(
        color: darkColors["onSurface"],
      )
    ),





    ),

);