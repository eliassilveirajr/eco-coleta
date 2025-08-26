import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const Center(
        child: Text(
          'Bem-vindo à sua conta!',
          style: TextStyle(fontSize: 24),
        ),
      ),
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
                  // Adicionar imagem do perfil aqui
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Text(
                  'José', // Nome do usuário
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(icon: Icons.person, text: 'Perfil', onTap: () => context.go('/perfil')),
          _buildDrawerItem(icon: Icons.calendar_today, text: 'Agendamento', onTap: () => context.go('/agendamento')),
          _buildDrawerItem(icon: Icons.history, text: 'Histórico', onTap: () => context.go('/home')),
          _buildDrawerItem(icon: Icons.swap_horiz, text: 'Trocas', onTap: () => context.go('/trocas')),
          _buildDrawerItem(icon: Icons.settings, text: 'Configurações', onTap: () => {}),
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
