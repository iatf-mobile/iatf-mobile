import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iatf_mobile/modules/model/fichas_model.dart';
import 'package:iatf_mobile/modules/provider/lotes_provider.dart';

class CriarFichaScreen extends ConsumerStatefulWidget {
  const CriarFichaScreen({super.key});

  @override
  ConsumerState<CriarFichaScreen> createState() => _CriarFichaScreenState();
}

class _CriarFichaScreenState extends ConsumerState<CriarFichaScreen> {
  final _formKey = GlobalKey<FormState>();

  final _tituloController = TextEditingController();
  final _subtituloController = TextEditingController();

  DateTime? _dataInicio;
  DateTime? _dataIatf;
  DateTime? _dataFim;

  Future<void> _selecionarData(
    DateTime? atual,
    void Function(DateTime) onSelected,
  ) async {
    final agora = DateTime.now();

    final data = await showDatePicker(
      context: context,
      initialDate: atual ?? agora,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );

    if (data != null) {
      onSelected(data);
    }
  }

  void _salvarFicha() {
    if (!_formKey.currentState!.validate()) return;
    if (_dataInicio == null || _dataIatf == null || _dataFim == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Selecione todas as datas')));
      return;
    }

    final novoLote = LoteModel(
      titulo: _tituloController.text,
      subtitulo: _subtituloController.text,
      dataInicio: _dataInicio!,
      dataIatf: _dataIatf!,
      dataFim: _dataFim!,
    );

    ref.read(lotesProvider.notifier).adicionarLote(novoLote);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Ficha')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _tituloController,
                decoration: const InputDecoration(labelText: 'Título'),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Informe o título' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _subtituloController,
                decoration: const InputDecoration(labelText: 'Subtítulo'),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Informe o subtítulo' : null,
              ),
              const SizedBox(height: 24),

              _BotaoData(
                label: 'Data de Início',
                data: _dataInicio,
                onTap: () => _selecionarData(
                  _dataInicio,
                  (d) => setState(() => _dataInicio = d),
                ),
              ),
              _BotaoData(
                label: 'Data IATF',
                data: _dataIatf,
                onTap: () => _selecionarData(
                  _dataIatf,
                  (d) => setState(() => _dataIatf = d),
                ),
              ),
              _BotaoData(
                label: 'Data de Fim',
                data: _dataFim,
                onTap: () => _selecionarData(
                  _dataFim,
                  (d) => setState(() => _dataFim = d),
                ),
              ),

              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: _salvarFicha,
                child: const Text('Salvar Ficha'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BotaoData extends StatelessWidget {
  final String label;
  final DateTime? data;
  final VoidCallback onTap;

  const _BotaoData({
    required this.label,
    required this.data,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: OutlinedButton(
        onPressed: onTap,
        child: Text(
          data == null
              ? label
              : '$label: ${data!.day}/${data!.month}/${data!.year}',
        ),
      ),
    );
  }
}
