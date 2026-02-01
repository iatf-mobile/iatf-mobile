import 'package:flutter/material.dart';
import 'package:iatf_mobile/modules/screens/home/tarefas_card.dart';
import 'package:iatf_mobile/modules/shared/widgets/botton_bar.dart';
import 'package:iatf_mobile/modules/shared/widgets/top_bar.dart';

// Widgets da home
import 'package:iatf_mobile/modules/screens/home/atividades_recentes.dart';
import 'package:iatf_mobile/modules/screens/home/gestao_veterinaria.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(pinned: true, delegate: _TopBarDelegate()),

          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                TarefasCard(),
                SizedBox(height: 30),
                GestaoVeterinaria(),
                SizedBox(height: 24),
                AtividadesRecentes(),
                SizedBox(height: 80),
              ]),
            ),
          ),
        ],
      ),

      // BottomBar fixa
      bottomNavigationBar: const CustomBottomBar(),
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
