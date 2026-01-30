import 'package:flutter/material.dart';
import 'package:iatf_mobile/modules/screens/home_page.dart';
import 'package:iatf_mobile/modules/screens/login/login_screen.dart';
import 'package:iatf_mobile/modules/shared/colors/app_thme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Tema global do app
      theme: AppTheme.light,

      // Tela inicial
      home: const LoginScreen(),

      // Rotas
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
