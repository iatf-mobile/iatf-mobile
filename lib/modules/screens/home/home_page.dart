import 'package:flutter/material.dart';
import 'package:iatf_mobile/modules/screens/home/tarefas_card.dart';

// Widgets da home
import 'package:iatf_mobile/modules/screens/home/atividades_recentes.dart';
import 'package:iatf_mobile/modules/screens/home/gestao_veterinaria.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        TarefasCard(),
        SizedBox(height: 30),
        GestaoVeterinaria(),
        SizedBox(height: 24),
        AtividadesRecentes(),
        SizedBox(height: 80),
      ],
    );
  }
}
