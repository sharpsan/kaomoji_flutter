import 'package:flutter/material.dart';

class Palette {
  static const _blackPrimaryValue = 0xFF000000;

  static const MaterialColor black = const MaterialColor(
    _blackPrimaryValue,
    const <int, Color>{
      50:  const Color(0xFF000000),
      100: const Color(0xFFB3B3B3),
      200: const Color(0xFF808080),
      300: const Color(0xFF4D4D4D),
      400: const Color(0xFF262626),
      500: const Color(_blackPrimaryValue),
      600: const Color(0xFF000000),
      700: const Color(0xFF000000),
      800: const Color(0xFF000000),
      900: const Color(0xFF000000),
    },
  );
}
