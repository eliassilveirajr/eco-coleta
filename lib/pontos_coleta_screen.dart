
import 'package:flutter/material.dart';

// Modelo de dados simples para um Ponto de Coleta
class PontoColeta {
  final String nome;
  final String endereco;
  final List<String> materiais;
  final String horario;

  PontoColeta({
    required this.nome,
    required this.endereco,
    required this.materiais,
    required this.horario,
  });
}

class PontosColetaScreen extends StatelessWidget {
  PontosColetaScreen({super.key});

  final List<PontoColeta> pontosDeColeta = [
    PontoColeta(
      nome: 'EcoPonto ReciclaVale',
      endereco: 'Av. Mario Uriarte, 98 - Cordeiros',
      materiais: ['Plástico', 'Vidro', 'Metal'],
      horario: 'Segunda a Sexta, 8h às 17h',
    ),
    PontoColeta(
      nome: 'EcoPonto Santa Regina',
      endereco: 'Avenida Marcos Aurélio Seara, 12 - Santa Regina',
      materiais: ['Papel', 'Óleo de Cozinha'],
      horario: 'Todos os dias, 9h às 20h',
    ),
    PontoColeta(
      nome: 'EcoPonto Cidade Nova',
      endereco: 'Rua Palmir Francisco Dias, 987, Cidade Nova',
      materiais: ['Eletrônicos', 'Baterias'],
      horario: 'Sábados, 9h às 15h',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pontos de Coleta'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: pontosDeColeta.length,
        itemBuilder: (context, index) {
          final ponto = pontosDeColeta[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ponto.nome,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          ponto.endereco,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.watch_later_outlined, size: 16, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(
                        ponto.horario,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  Text(
                    'Materiais Aceitos:',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: ponto.materiais.map((material) {
                      return Chip(
                        label: Text(material),
                        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                        side: BorderSide.none,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

