import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F0),
      appBar: AppBar(
        title: Text(
          'ECO COLETA',
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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSaldoCard(context),
          const SizedBox(height: 24),
          _buildHistoricoSection(context),
        ],
      ),
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
          'Histórico',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildHistoricoItem(context, Icons.recycling, 'Coleta de Plástico', '+ R\$ 5,00', '10/07/2024', Colors.green),
        const Divider(),
        _buildHistoricoItem(context, Icons.shopping_bag, 'Troca por Desconto', '- 500 pts', '08/07/2024', Colors.orange),
        const Divider(),
        _buildHistoricoItem(context, Icons.recycling, 'Coleta de Vidro', '+ R\$ 7,50', '05/07/2024', Colors.green),
        const Divider(),
        _buildHistoricoItem(context, Icons.recycling, 'Coleta de Metal', '+ R\$ 10,00', '02/07/2024', Colors.green),
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

  Widget _buildDrawer(BuildContext context) {
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
          _buildDrawerItem(icon: Icons.person, text: 'Perfil', onTap: () => context.go('/home/perfil')),
          _buildDrawerItem(icon: Icons.history, text: 'Histórico', onTap: () => context.go('/home')),
          _buildDrawerItem(icon: Icons.calendar_today, text: 'Agendamento', onTap: () => context.go('/home/agendamento')),
          _buildDrawerItem(icon: Icons.swap_horiz, text: 'Trocas', onTap: () => context.go('/home/trocas')),
          _buildDrawerItem(icon: Icons.settings, text: 'Configurações', onTap: () => context.go('/home/configuracoes')),
          const Divider(),
          _buildDrawerItem(icon: Icons.exit_to_app, text: 'Sair', onTap: () => context.go('/login')),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem({required IconData icon, required String text, required GestureTapCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }
}
