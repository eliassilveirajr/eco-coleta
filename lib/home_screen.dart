
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

// Importe as telas que serão usadas na navegação
import 'package:myapp/agendamento_screen.dart';
import 'package:myapp/configuracoes_screen.dart';
import 'package:myapp/pontos_coleta_screen.dart'; // Importa a nova tela
import 'package:myapp/profile_screen.dart';
import 'package:myapp/trocas_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Índice da tela selecionada

  // Lista de telas que o Drawer pode navegar
  static List<Widget> _widgetOptions = <Widget>[
    DashboardContent(), // O conteúdo original da HomeScreen
    AgendamentoScreen(),
    PontosColetaScreen(), // Nova tela
    TrocasScreen(),
    ProfileScreen(),
    ConfiguracoesScreen(),
  ];

  // Lista de títulos correspondentes a cada tela
  static const List<String> _widgetTitles = <String>[
    'ECO COLETA',
    'Agendamentos',
    'Pontos de Coleta', // Novo título
    'Trocas e Recompensas',
    'Meu Perfil',
    'Configurações',
  ];

  // Método chamado quando um item do drawer é tocado
  void _onSelectItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Fecha o drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F0),
      appBar: AppBar(
        title: Text(
          _widgetTitles[_selectedIndex], // Título dinâmico
          style: GoogleFonts.oswald(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: _buildDrawer(context),
      body: _widgetOptions.elementAt(_selectedIndex), // Corpo dinâmico
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Text(
                  'Luiz',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(
            icon: Icons.home,
            text: 'Início',
            isSelected: _selectedIndex == 0,
            onTap: () => _onSelectItem(0),
          ),
          _buildDrawerItem(
            icon: Icons.calendar_today,
            text: 'Agendamento',
            isSelected: _selectedIndex == 1,
            onTap: () => _onSelectItem(1),
          ),
          _buildDrawerItem(
            icon: Icons.location_on,
            text: 'Pontos de Coleta',
            isSelected: _selectedIndex == 2,
            onTap: () => _onSelectItem(2),
          ),
          _buildDrawerItem(
            icon: Icons.swap_horiz,
            text: 'Trocas',
            isSelected: _selectedIndex == 3,
            onTap: () => _onSelectItem(3),
          ),
          _buildDrawerItem(
            icon: Icons.person,
            text: 'Perfil',
            isSelected: _selectedIndex == 4,
            onTap: () => _onSelectItem(4),
          ),
          _buildDrawerItem(
            icon: Icons.settings,
            text: 'Configurações',
            isSelected: _selectedIndex == 5,
            onTap: () => _onSelectItem(5),
          ),
          const Divider(),
          _buildDrawerItem(
            icon: Icons.exit_to_app,
            text: 'Sair',
            onTap: () => context.go('/login'),
          ),
        ],
      ),
    );
  }

  // Widget para os itens do Drawer, com feedback visual de seleção
  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    bool isSelected = false,
    required GestureTapCallback onTap,
  }) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Icon(icon, color: isSelected ? theme.colorScheme.primary : null),
      title: Text(
        text,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? theme.colorScheme.primary : null,
        ),
      ),
      tileColor: isSelected ? theme.colorScheme.primary.withOpacity(0.1) : null,
      onTap: onTap,
    );
  }
}


// Widget para o conteúdo original da tela inicial (Dashboard)
class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildSaldoCard(context),
        const SizedBox(height: 24),
        _buildHistoricoSection(context),
      ],
    );
  }

  Widget _buildSaldoCard(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Seu Saldo',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'R\$ 22,50',
                  style: GoogleFonts.oswald(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  '1500 pts',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoricoSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Histórico Recente',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildHistoricoItem(context, Icons.recycling, 'Coleta de Plástico', '+ R\$ 5,00', '10/07/2025', Colors.green),
        const Divider(),
        _buildHistoricoItem(context, Icons.shopping_bag, 'Troca por Desconto', '- 500 pts', '08/07/2025', Colors.orange),
        const Divider(),
        _buildHistoricoItem(context, Icons.recycling, 'Coleta de Vidro', '+ R\$ 7,50', '05/07/2025', Colors.green),
        const Divider(),
        _buildHistoricoItem(context, Icons.recycling, 'Coleta de Metal', '+ R\$ 10,00', '02/07/2025', Colors.green),
      ],
    );
  }

  Widget _buildHistoricoItem(BuildContext context, IconData icon, String title, String value, String date, Color color) {
    return ListTile(
      leading: Icon(icon, color: color, size: 32),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(date),
      trailing: Text(
        value,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
    );
  }
}
