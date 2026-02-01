import 'package:flutter/material.dart';
import 'package:iatf_mobile/mainPai.dart';
import 'package:iatf_mobile/modules/screens/login/login_screen.dart';
import 'package:iatf_mobile/modules/shared/themes/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
        '/main': (context) => const MainShell(),
      },
    );
  }
}
