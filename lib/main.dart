import 'package:flutter/material.dart';

import 'core/constants/app_colors.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const LexoraApp());
}

class LexoraApp extends StatelessWidget {
  const LexoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lexora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          surface: AppColors.surface,
          primary: AppColors.textPrimary,
        ),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
