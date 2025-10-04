import 'package:flutter/material.dart';

class NovoAgendamentoScreen extends StatefulWidget {
  const NovoAgendamentoScreen({super.key});

  @override
  State<NovoAgendamentoScreen> createState() => _NovoAgendamentoScreenState();
}

class _NovoAgendamentoScreenState extends State<NovoAgendamentoScreen> {
  // Variáveis de estado
  String? _selectedMaterial;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  // Lista de materiais para o dropdown
  final List<String> _materials = [
    'Plásticos e Embalagens',
    'Vidros e Garrafas',
    'Papel e Papelão',
    'Metais e Latas',
    'Lixo Eletrônico',
    'Resíduos Orgânicos'
  ];

  // Função para exibir o seletor de data
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Função para exibir o seletor de hora
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Verifica se todos os campos estão preenchidos
    final bool isFormReady =
        _selectedMaterial != null && _selectedDate != null && _selectedTime != null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Agendamento'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Dropdown para seleção de material
              DropdownButtonFormField<String>(
                value: _selectedMaterial,
                isExpanded: true,
                decoration: const InputDecoration(
                  labelText: 'Tipo de Material',
                  prefixIcon: Icon(Icons.recycling),
                  border: OutlineInputBorder(),
                ),
                hint: const Text('Selecione o material para a coleta'),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedMaterial = newValue;
                  });
                },
                items: _materials.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),

              // Seletor de data
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('Data da Coleta'),
                subtitle: Text(_selectedDate == null
                    ? 'Nenhuma data selecionada'
                    : '${_selectedDate!.day.toString().padLeft(2, '0')}/${_selectedDate!.month.toString().padLeft(2, '0')}/${_selectedDate!.year}'),
                onTap: () => _selectDate(context),
              ),
              const Divider(),

              // Seletor de hora
              ListTile(
                leading: const Icon(Icons.access_time),
                title: const Text('Hora da Coleta'),
                subtitle: Text(_selectedTime == null
                    ? 'Nenhuma hora selecionada'
                    : _selectedTime!.format(context)),
                onTap: () => _selectTime(context),
              ),
              const Spacer(),

              // Botão de confirmação
              ElevatedButton.icon(
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Confirmar Agendamento'),
                onPressed: isFormReady
                    ? () {
                        // Lógica para confirmar o agendamento
                        final String confirmationMessage =
                            'Coleta de "$_selectedMaterial" agendada com sucesso!';

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(confirmationMessage),
                            backgroundColor: Colors.green,
                          ),
                        );
                        // Voltar para a tela anterior
                        Navigator.of(context).pop();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
