import 'package:flutter/material.dart';

class TimelineWidget extends StatelessWidget {
  final String startDate;
  final String endDate;

  const TimelineWidget({
    super.key,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Datas (esquerda e direita)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              startDate,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
              endDate,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),

        const SizedBox(height: 8),

        // Linha com bolinhas
        Row(
          children: [
            _dot(isActive: true),
            _line(),
            _dot(isActive: true),
            _line(),
            _dot(isActive: false),
          ],
        ),

        const SizedBox(height: 6),

        // Labels
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('INÍCIO', style: TextStyle(fontSize: 12, color: Colors.grey)),
            Text('IATF', style: TextStyle(fontSize: 12, color: Colors.grey)),
            Text('FIM', style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ],
    );
  }

  // Bolinha
  Widget _dot({required bool isActive}) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey.shade400,
        shape: BoxShape.circle,
      ),
    );
  }

  // Linha entre as bolinhas
  Widget _line() {
    return Expanded(child: Container(height: 2, color: Colors.grey.shade300));
  }
}
