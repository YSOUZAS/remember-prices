import 'package:flutter/material.dart';

const int _bluePrimaryValue = 0xFF4864E6;
const MaterialColor blueTheme = MaterialColor(
  _bluePrimaryValue,
  <int, Color>{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(_bluePrimaryValue),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  },
);

const int _whitePrimaryValue = 0xFFF2F4FF;
const MaterialColor whiteTheme = MaterialColor(
  _whitePrimaryValue,
  <int, Color>{
    50: Color(0xFF243273),
    100: Color(0xFF283880),
    200: Color(0xFF2F4399),
    300: Color(0xFF374EB3),
    400: Color(0xFF3F59CC),
    500: Color(_whitePrimaryValue),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  },
);
