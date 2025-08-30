
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Modelo para representar uma recompensa
class Recompensa {
  final String icone;
  final String titulo;
  final String descricao;
  final int pontos;

  Recompensa({
    required this.icone,
    required this.titulo,
    required this.descricao,
    required this.pontos,
  });
}

class TrocasScreen extends StatefulWidget {
  const TrocasScreen({super.key});

  @override
  State<TrocasScreen> createState() => _TrocasScreenState();
}

class _TrocasScreenState extends State<TrocasScreen> {
  // Saldo de pontos inicial do usuário
  int saldoDePontos = 2500;

  // Lista de recompensas disponíveis (dados de exemplo)
  final List<Recompensa> recompensas = [
    Recompensa(
      icone: 'assets/images/icon.png',
      titulo: '10% Desconto no Mercado',
      descricao: 'Use em qualquer compra no mercado parceiro.',
      pontos: 1000,
    ),
    Recompensa(
      icone: 'assets/images/icon.png',
      titulo: 'Passe de Ônibus Grátis',
      descricao: 'Uma passagem para qualquer linha da cidade.',
      pontos: 500,
    ),
    Recompensa(
      icone: 'assets/images/icon.png',
      titulo: 'Ingresso de Cinema',
      descricao: 'Válido para qualquer filme em cartaz.',
      pontos: 1500,
    ),
    Recompensa(
      icone: 'assets/images/icon.png',
      titulo: 'Crédito de R\$ 5,00 no iFood',
      descricao: 'Para usar no seu próximo pedido.',
      pontos: 800,
    ),
     Recompensa(
      icone: 'assets/images/icon.png',
      titulo: 'Recarga de Celular',
      descricao: 'R\$ 10 de crédito para sua linha.',
      pontos: 2000,
    ),
  ];

  void _mostrarConfirmacaoTroca(Recompensa recompensa) {
    if (saldoDePontos < recompensa.pontos) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pontos insuficientes para esta troca.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Troca'),
          content: Text('Deseja trocar ${recompensa.pontos} pontos por "${recompensa.titulo}"?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FilledButton(
              child: const Text('Confirmar'),
              onPressed: () {
                setState(() {
                  saldoDePontos -= recompensa.pontos;
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Troca realizada com sucesso!'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recompensas',
          style: GoogleFonts.oswald(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      // SafeArea resolve o problema de sobreposição com a barra de navegação
      body: SafeArea(
        child: Column(
          children: [
            _buildCardSaldo(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Recompensas Disponíveis',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: recompensas.length,
                itemBuilder: (context, index) {
                  final recompensa = recompensas[index];
                  return _buildRecompensaCard(recompensa);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardSaldo() {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 40),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Meu Saldo de Pontos',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '$saldoDePontos',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecompensaCard(Recompensa recompensa) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image.asset(recompensa.icone, width: 40, height: 40),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recompensa.titulo,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    recompensa.descricao,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${recompensa.pontos} Pts',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                const SizedBox(height: 4),
                ElevatedButton(
                  onPressed: () => _mostrarConfirmacaoTroca(recompensa),
                  child: const Text('Trocar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
