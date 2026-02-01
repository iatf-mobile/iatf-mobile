import 'package:flutter/material.dart';
import 'package:iatf_mobile/modules/shared/colors/app_colors.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.background,

          // remove arredondamento embaixo
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),

          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,

              // CONTROLA A FORÇA DA SOMBRA
              blurRadius: 1,

              // SOMBRA PARA BAIXO (igual visualmente à BottomBar)
              offset: const Offset(0, 1),
            ),
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_buildProfileInfo(), _buildActions()],
        ),
      ),
    );
  }

  /// Parte esquerda: foto + nome + subtítulo
  /// Parte esquerda: foto + nome + subtítulo
  Widget _buildProfileInfo() {
    return Row(
      children: [
        // CÍRCULO COM ÍCONE DE USER
        Container(
          margin: const EdgeInsets.only(right: 14),
          width: 46, // Ajustei para ficar proporcional (circular perfeito)
          height: 46,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white, // Fundo branco
            border: Border.all(
              color: Colors.grey.shade700, // Mesma cor do ícone de notificação
              width: 1.5, // Espessura da borda
            ),
          ),
          child: const Icon(
            Icons.person, // Ícone de user do Material Design
            color: Colors.black, // Ícone preto
            size: 28,
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dr. João Silva',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 2),

            // Subtítulo com cores diferentes
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 13),
                children: [
                  TextSpan(
                    text: 'Veterinário',
                    style: TextStyle(
                      color: Color(0xFF2E7D32),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: ' | Fazenda',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Parte direita: ícones
  Widget _buildActions() {
    return Row(
      children: [
        _actionIcon(Icons.notifications),
        const SizedBox(width: 10),
        _actionIcon(Icons.help_outline),
      ],
    );
  }

  /// Ícone clicável
  Widget _actionIcon(IconData icon) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () {
        // ação futura
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(icon, size: 26, color: Colors.grey.shade700),
      ),
    );
  }
}
