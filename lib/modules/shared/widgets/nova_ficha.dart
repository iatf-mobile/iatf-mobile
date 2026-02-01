import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

/// Widget responsável por criar uma nova ficha
class NovaFichaWidget extends StatefulWidget {
  const NovaFichaWidget({super.key});

  @override
  State<NovaFichaWidget> createState() => _NovaFichaWidgetState();
}

class _NovaFichaWidgetState extends State<NovaFichaWidget> {
  /// Ação executada ao tocar no card
  void _criarNovaFicha() {
    // lógica futura
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _criarNovaFicha,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primary, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.add_circle_outline, color: AppColors.primary),
            SizedBox(width: 8),
            Text(
              'Nova Ficha',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
