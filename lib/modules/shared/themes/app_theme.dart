import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

// Tema principal do aplicativo
class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    );
  }
}
