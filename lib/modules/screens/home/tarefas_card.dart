import 'package:flutter/material.dart';

class TarefasCard extends StatefulWidget {
  const TarefasCard({super.key});

  @override
  State<TarefasCard> createState() => _TarefasHojeState();
}

class _TarefasHojeState extends State<TarefasCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,

      // Altura mínima aumentada para evitar overflow
      height: expanded ? screenHeight * 0.65 : 110,

      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.12),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TOPO
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Tarefas Hoje',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ),

              /// BOTÃO >
              IconButton(
                icon: Icon(
                  expanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
              ),
            ],
          ),

          //  Espaço reduzido para aproximar o resumo
          const SizedBox(height: 4),

          /// RESUMO
          if (!expanded)
            const Text(
              'Você tem 3 tarefas hoje.',
              style: TextStyle(fontSize: 14),
            ),

          /// LISTA COMPLETA (EXPANDIDO)
          if (expanded) ...[
            const SizedBox(height: 12),
            const Divider(),

            //  Flexible mantido para não causar overflow
            Flexible(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  _TaskItem('Manejo do Bovino #402'),
                  _TaskItem('Aplicar vacina - Canino Max'),
                  _TaskItem('Atualizar ficha técnica'),
                  _TaskItem('Registrar custo de medicação'),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _TaskItem extends StatelessWidget {
  final String text;

  const _TaskItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text('• $text', style: const TextStyle(fontSize: 15)),
    );
  }
}
