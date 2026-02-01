import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

/// Widget responsável por exibir as informações do lote
class LoteCardWidget extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final DateTime dataInicio;
  final DateTime dataIatf;
  final DateTime dataFim;

  const LoteCardWidget({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.dataInicio,
    required this.dataIatf,
    required this.dataFim,
  });

  /// Ação executada ao clicar no botão
  void _enviarParaInseminador() {
    // lógica futura
  }

  String _formatarData(DateTime data) {
    const meses = [
      'JAN',
      'FEV',
      'MAR',
      'ABR',
      'MAI',
      'JUN',
      'JUL',
      'AGO',
      'SET',
      'OUT',
      'NOV',
      'DEZ',
    ];

    return '${data.day.toString().padLeft(2, '0')} ${meses[data.month - 1]}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabeçalho com título e status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitulo,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              Transform.translate(
                offset: const Offset(0, -12),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'EM ANDAMENTO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Linha do tempo
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatarData(dataInicio),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _formatarData(dataFim),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Row(
                children: const [
                  _TimelineDot(isActive: true),
                  _TimelineLine(),
                  _TimelineDot(isActive: true),
                  _TimelineLine(),
                  _TimelineDot(isActive: false),
                ],
              ),

              const SizedBox(height: 6),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'INÍCIO',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    'IATF',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    'FIM',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _enviarParaInseminador,
              child: const Text(
                'Enviar p/ Inseminador',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Ponto da timeline
class _TimelineDot extends StatelessWidget {
  final bool isActive;

  const _TimelineDot({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _TimelineLine extends StatelessWidget {
  const _TimelineLine();

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(height: 2, color: Colors.grey.shade300));
  }
}
