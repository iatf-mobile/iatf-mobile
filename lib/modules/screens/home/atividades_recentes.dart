import 'package:flutter/material.dart';
import 'package:iatf_mobile/modules/screens/home/action_item.dart';

class AtividadesRecentes extends StatefulWidget {
  const AtividadesRecentes({super.key});

  @override
  State<AtividadesRecentes> createState() => _AtividadesRecentesState();
}

class _AtividadesRecentesState extends State<AtividadesRecentes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Atividades Recentes',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),

        ActivityItem(
          icon: Icons.notifications,
          text: 'Ficha de Bovino #402 utilizada\nCalendário',
          color: Colors.green,
        ),
        const SizedBox(height: 12),
        ActivityItem(
          icon: Icons.notifications,
          text: 'Custo adicionado (Vacina)\nConsulta agendada - Canino Max',
          color: Colors.orange,
        ),
      ],
    );
  }
}
