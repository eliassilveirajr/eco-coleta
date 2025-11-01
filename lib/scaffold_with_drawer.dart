
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ScaffoldWithDrawer extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithDrawer({super.key, required this.navigationShell});

  // Lista de títulos correspondentes a cada aba/branch
  static const List<String> _widgetTitles = <String>[
    'ECO COLETA',
    'Meu Perfil',
    'Agendamentos',
    'Trocas e Recompensas',
    'Configurações',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F0),
      appBar: AppBar(
        title: Text(
          _widgetTitles[navigationShell.currentIndex], // Título dinâmico
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
      // O corpo agora é a navigationShell, que renderiza a tela da aba atual
      body: navigationShell,
    );
  }

  // Navega para a aba correspondente ao índice
  void _onSelectItem(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      // Permite que a navegação seja a mesma se a aba já estiver selecionada
      initialLocation: index == navigationShell.currentIndex,
    );
    Navigator.pop(context); // Fecha o drawer após a seleção
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
            context: context,
            icon: Icons.home,
            text: 'Início',
            index: 0,
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.person,
            text: 'Perfil',
            index: 1,
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.calendar_today,
            text: 'Agendamento',
            index: 2,
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.swap_horiz,
            text: 'Trocas',
            index: 3,
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.settings,
            text: 'Configurações',
            index: 4,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sair'),
            onTap: () {
              // Navegação correta para a tela de login
              context.go('/login');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String text,
    required int index,
  }) {
    final bool isSelected = navigationShell.currentIndex == index;
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
      onTap: () => _onSelectItem(context, index),
    );
  }
}
