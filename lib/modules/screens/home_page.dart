import 'package:flutter/material.dart';
import 'package:iatf_mobile/modules/shared/widgets/botton_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Conteúdo da tela', style: TextStyle(fontSize: 20)),
      ),

      bottomNavigationBar: const CustomBottomBar(), //Botton bar(A inferior)
    );
  }
}
