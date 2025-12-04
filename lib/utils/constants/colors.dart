import 'package:flutter/material.dart';

class GMColors {
  GMColors._();

  /// App Basic Colors
  static const Color primary = Color(0xFF1B4D3E);
  static const Color secondary = Color(0xFFD9933D);
  static const Color accent = Color(0xFF9B2915);

  /// Gradient Colors
  /*static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [Color(0xFF1B4D3E), Color(0xFFD9933D), Color(0xFF9B2915)],
  );*/

  /// Text Colors
  static const Color textPrimary = Color(0xFF363636);
  static const Color textSecondary = Color(0xFF707070);
  static const Color textWhite = Colors.white;

  ///Background Colors
  static const Color light = Color(0xFFF5F5F0);
  static const Color dark = Color(0xFF1A3A54);
  static const Color primaryBackground = Color(0xFFF5F5F0);

  /// Background Container Colors
  static const Color lightContainer = Color(0xFFF5F5F0);
  static Color darkContainer = GMColors.secondary.withValues(alpha: 0.1);

  /// Border Colors
  static const Color borderPrimary = Color(0xFFE0E0E0);
  static const Color borderSecondary = Color(0xFFD9D9D9);

  /// Error and Validation Colors
  static const Color error = Color(0xFF9B2915);
  static const Color success = Color(0xFFD9933D);
  static const Color warning = Color(0xFF9B2915);
  static const Color info = Color(0xFF1B4D3E);

  /// Neutral Shades
  static const Color black = Color(0xFF1E1E1E);
  static const Color darkerGrey = Color(0xFF363636);
  static const Color darkGrey = Color(0xFF505050);
  static const Color grey = Color.fromARGB(255, 188, 185, 185);
  static const Color softGrey = Color(0xFFD8D8D0);
  static const Color lightGrey = Color(0xFFEAEAE4);
  static const Color white = Color(0xFFFFFFFF);
}
