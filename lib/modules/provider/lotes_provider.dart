import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iatf_mobile/modules/model/fichas_model.dart';

/// Provider público
final lotesProvider = StateNotifierProvider<LotesNotifier, List<LoteModel>>(
  (ref) => LotesNotifier(),
);

/// Controlador de estado das fichas
class LotesNotifier extends StateNotifier<List<LoteModel>> {
  LotesNotifier()
    : super([
        LoteModel(
          titulo: 'Lote Teste JLC',
          subtitulo: 'CE8 (Cipionato no DB)',
          dataInicio: DateTime(2025, 1, 4),
          dataIatf: DateTime(2025, 1, 14),
          dataFim: DateTime(2025, 1, 24),
        ),
      ]);

  void adicionarLote(LoteModel lote) {
    state = [...state, lote];
  }

  void limpar() {
    state = [];
  }
}
