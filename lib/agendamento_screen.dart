import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Modelo de dados para um agendamento
class Agendamento {
  final String titulo;
  final String data;
  final String status;

  Agendamento({required this.titulo, required this.data, required this.status});
}

class AgendamentoScreen extends StatelessWidget {
  const AgendamentoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de agendamentos fixos (mock)
    final List<Agendamento> agendamentos = [
      Agendamento(
        titulo: 'Coleta de Plásticos e Embalagens',
        data: '03 de setembro de 2025 - 08:15',
        status: 'Agendado',
      ),
      Agendamento(
        titulo: 'Coleta de Papel e Papelão',
        data: '25 de agosto de 2025 - 08:00',
        status: 'Concluído',
      ),
      Agendamento(
        titulo: 'Coleta de Metais e Latas',
        data: '07 de agosto de 2025 - 10:00',
        status: 'Concluído',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Agendamentos'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: agendamentos.length,
        itemBuilder: (context, index) {
          final agendamento = agendamentos[index];
          final bool isAgendado = agendamento.status == 'Agendado';
          final Color statusColor = isAgendado ? Colors.orange.shade700 : Colors.green.shade700;
          final IconData statusIcon = isAgendado ? Icons.schedule : Icons.check_circle;

          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              leading: Icon(statusIcon, color: statusColor, size: 40),
              title: Text(
                agendamento.titulo,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(agendamento.data),
              ),
              trailing: Text(
                agendamento.status,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Ação para navegar para a tela de novo agendamento (será criada)
           context.go('/home/agendamento/novo');
        },
        label: const Text('Novo Agendamento'),
        icon: const Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
