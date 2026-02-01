/// Modelo de uma ficha/lote
class LoteModel {
  final String titulo;
  final String subtitulo;
  final DateTime dataInicio;
  final DateTime dataIatf;
  final DateTime dataFim;

  LoteModel({
    required this.titulo,
    required this.subtitulo,
    required this.dataInicio,
    required this.dataIatf,
    required this.dataFim,
  });
}
