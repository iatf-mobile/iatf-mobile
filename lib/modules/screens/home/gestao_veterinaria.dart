import 'package:flutter/material.dart';
import 'package:iatf_mobile/modules/screens/fichas/criar_ficha_screen.dart';
import 'package:iatf_mobile/modules/screens/home/action_card.dart';

class GestaoVeterinaria extends StatefulWidget {
  const GestaoVeterinaria({super.key});

  @override
  State<GestaoVeterinaria> createState() => _QuickActionsState();
}

class _QuickActionsState extends State<GestaoVeterinaria> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gestão Veterinária',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),

        //const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ActionCard(
              Icons.calendar_today,
              'Criar Ficha',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CriarFichaScreen()),
                );
              },
            ),
            const ActionCard(Icons.attach_money, 'Custos'),
            const ActionCard(Icons.event, 'Agendar'),
            const ActionCard(Icons.pets, 'Exames'),
          ],
        ),
      ],
    );
  }
}
