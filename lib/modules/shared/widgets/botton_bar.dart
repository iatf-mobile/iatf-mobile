import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iatf_mobile/modules/shared/colors/app_colors.dart';

// BottomBar personalizada
class CustomBottomBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onChanged;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onChanged,
  });

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

// Adicionado 'with SingleTickerProviderStateMixin' para habilitar animações
class _CustomBottomBarState extends State<CustomBottomBar>
    with SingleTickerProviderStateMixin {
  // Índice do item selecionado
  int _selectedIndex = 0;

  // Controlador da animação de giro
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();

    // índice vem da tela
    _selectedIndex = widget.currentIndex;

    _rotationController = AnimationController(
      // 250ms é um tempo ideal para ver a transformação sem ser lento
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

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
        // evitar troca desnecessária
        if (_selectedIndex == index) return;

        setState(() {
          _selectedIndex = index;
        });

        // informa o pai (MainShell)
        widget.onChanged(index);
      },

      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn,
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
              duration: const Duration(milliseconds: 1000),
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
          // ESSENCIAL: Alterna entre ir para o X e voltar para o +
          if (_rotationController.isCompleted) {
            _rotationController.reverse();
          } else {
            _rotationController.forward();
          }
          debugPrint('Botão central pressionado');
        },

        // RotationTransition faz o efeito de giro
        child: RotationTransition(
          // 0.125 turns = 45 graus. Isso transforma o + em X.
          turns: Tween(begin: 0.0, end: 0.125).animate(
            CurvedAnimation(
              parent: _rotationController,
              curve: Curves.easeInOut,
            ),
          ),
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
      ),
    );
  }
}

/*Constrói o ícone do item da bottom bar... */
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
