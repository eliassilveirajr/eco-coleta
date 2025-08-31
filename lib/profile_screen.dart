
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // O Scaffold não precisa mais de AppBar, pois a HomeScreen já fornece uma.
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F0),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 80.0), // Adicionado padding inferior extra
        children: [
          _buildProfileHeader(context),
          const SizedBox(height: 24),
          _buildInfoCard(context),
          const SizedBox(height: 24),
          _buildStatsSection(context),
          // Um SizedBox extra no final pode garantir que o conteúdo role para cima da barra de navegação
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          child: Icon(Icons.person, size: 60, color: Colors.grey),
        ),
        const SizedBox(height: 16),
        Text(
          'Luiz Litterbug',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          'luiz.litterburg@email.com',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey[600],
              ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informações Pessoais',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Divider(height: 20, thickness: 1),
            _buildInfoRow(context, Icons.location_on, 'Endereço', 'Rua Uruguai, 458, Santa Catarina, SC'),
            _buildInfoRow(context, Icons.phone, 'Telefone', '(47) 99999-8888'),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              // CORREÇÃO: Usando context.push para empilhar a rota
              child: ElevatedButton(
                onPressed: () => context.push('/editar-perfil'),
                child: const Text('Editar Perfil'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Suas Conquistas',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _buildStatCard(context, Icons.eco, '350 KG', 'Resíduos Reciclados', Colors.green)),
            const SizedBox(width: 16),
            Expanded(child: _buildStatCard(context, Icons.star, '1500 PTS', 'Pontos Acumulados', Colors.orange)),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, IconData icon, String value, String label, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
