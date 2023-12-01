import 'package:flutter/material.dart';

const MaterialColor primarygreen =
    MaterialColor(_primarygreenPrimaryValue, <int, Color>{
  50: Color(0xFFE0F7F7),
  100: Color(0xFFB3EAEA),
  200: Color(0xFF80DDDD),
  300: Color(0xFF4DCFCF),
  400: Color(0xFF26C4C4),
  500: Color(_primarygreenPrimaryValue),
  600: Color(0xFF00B3B3),
  700: Color(0xFF00ABAB),
  800: Color(0xFF00A3A3),
  900: Color(0xFF009494),
});
const int _primarygreenPrimaryValue = 0xFF00BABA;

const MaterialColor primarygreenAccent =
    MaterialColor(_primarygreenAccentValue, <int, Color>{
  100: Color(0xFFBFFFFF),
  200: Color(_primarygreenAccentValue),
  400: Color(0xFF59FFFF),
  700: Color(0xFF40FFFF),
});
const int _primarygreenAccentValue = 0xFF8CFFFF;
