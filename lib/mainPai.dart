import 'package:flutter/material.dart';
import 'package:iatf_mobile/modules/screens/fichas/fichas.dart';
import 'package:iatf_mobile/modules/screens/home/home_page.dart';
import 'package:iatf_mobile/modules/shared/widgets/botton_bar.dart';
import 'package:iatf_mobile/modules/shared/widgets/top_bar.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    FichasScreen(),
    Placeholder(), // Rebanho
    Placeholder(), // Menu
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(pinned: true, delegate: _TopBarDelegate()),

          SliverFillRemaining(
            child: IndexedStack(index: _currentIndex, children: _pages),
          ),
        ],
      ),

      bottomNavigationBar: CustomBottomBar(
        currentIndex: _currentIndex,
        onChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

// regra do comportamento do scroll
class _TopBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 110;

  @override
  double get maxExtent => 110;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white, // impede o conteúdo de aparecer por trás
      child: const TopBar(),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
