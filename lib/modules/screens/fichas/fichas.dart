import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iatf_mobile/modules/provider/lotes_provider.dart';
import 'package:iatf_mobile/modules/shared/widgets/lote_card.dart';

/// Tela apenas de visualização das fichas
class FichasScreen extends ConsumerWidget {
  const FichasScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lotes = ref.watch(lotesProvider);

    if (lotes.isEmpty) {
      return const Center(
        child: Text(
          'Nenhuma ficha cadastrada',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: lotes.length,
      separatorBuilder: (_, __) => const SizedBox(height: 24),
      itemBuilder: (context, index) {
        final lote = lotes[index];

        return LoteCardWidget(
          titulo: lote.titulo,
          subtitulo: lote.subtitulo,
          dataInicio: lote.dataInicio,
          dataIatf: lote.dataIatf,
          dataFim: lote.dataFim,
        );
      },
    );
  }
}
