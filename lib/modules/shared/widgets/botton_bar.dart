import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iatf_mobile/modules/shared/colors/app_colors.dart';

// BottomBar personalizada
class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  // Índice do item selecionado
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // SafeArea evita conflito com botões do sistema
    return SafeArea(
      top: false,
      child: SizedBox(
        height: 95, //altura do +
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [_buildBottomBar(), _buildCenterButton()],
        ),
      ),
    );
  }

  // Barra inferior com os botões
  Widget _buildBottomBar() {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(child: _navItem(0, 'Início', icon: Icons.access_time)),
          Expanded(
            child: _navItem(1, 'Fichas', svgAsset: 'assets/icons/ficha.svg'),
          ),

          const Expanded(child: SizedBox()), // espaço do botão +

          Expanded(
            child: _navItem(2, 'Rebanho', svgAsset: 'assets/icons/cow1.svg'),
          ),
          Expanded(child: _navItem(3, 'Menu', icon: Icons.menu)),
        ],
      ),
    );
  }

  // Item individual da BottomBar
  Widget _navItem(int index, String label, {IconData? icon, String? svgAsset}) {
    final bool isSelected = index == _selectedIndex;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(
          0,
          isSelected ? -6 : 0, // sobe quando selecionado
          0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              duration: const Duration(milliseconds: 250),
              scale: isSelected ? 1.15 : 1.0, // leve zoom
              child: _buildIcon(isSelected, icon, svgAsset),
            ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 250),
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? AppColors.primary : AppColors.inactive,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }

  // Botão central flutuante
  Widget _buildCenterButton() {
    return Positioned(
      top: 0,
      child: GestureDetector(
        onTap: () {
          debugPrint('Botão central pressionado');
        },
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(Icons.add, color: Colors.white, size: 32),
        ),
      ),
    );
  }
}

/*Constrói o ícone do item da bottom bar, escolhendo entre ícone padrão do Flutter 
ou SVG dos assets, já aplicando a cor conforme o estado selecionado */
Widget _buildIcon(bool isSelected, IconData? icon, String? svgAsset) {
  final Color color = isSelected ? AppColors.primary : AppColors.inactive;

  if (icon != null) {
    return Icon(icon, size: 27, color: color);
  }

  if (svgAsset != null) {
    return SvgPicture.asset(
      svgAsset,
      width: 27,
      height: 27,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }

  return const SizedBox.shrink();
}
