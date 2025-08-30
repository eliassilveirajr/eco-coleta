
import 'package:flutter/material.dart';
import 'package:myapp/main.dart'; // Importar para ter acesso ao ThemeProvider
import 'package:provider/provider.dart';

class ConfiguracoesScreen extends StatelessWidget {
  const ConfiguracoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Usar o Consumer para reconstruir o widget quando o tema mudar
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: AppBar(
            // Usar a cor do tema para a AppBar
            title: const Text('Configurações'),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          body: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildSectionTitle(context, 'Preferências'),
              SwitchListTile(
                title: const Text('Receber Notificações'),
                value: true, // Valor de exemplo
                onChanged: (bool value) {
                  // Lógica futura para notificações
                },
                secondary: const Icon(Icons.notifications),
              ),
              const Divider(),
              _buildSectionTitle(context, 'Aparência'),
              ListTile(
                leading: const Icon(Icons.color_lens),
                title: const Text('Tema do Aplicativo'),
                subtitle: Text(_getThemeModeString(themeProvider.themeMode)),
                onTap: () {
                  _showThemeDialog(context, themeProvider);
                },
              ),
              const Divider(),
              _buildSectionTitle(context, 'Sobre'),
              ListTile(
                leading: const Icon(Icons.description),
                title: const Text('Termos de Serviço'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip),
                title: const Text('Política de Privacidade'),
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }

  // Helper para converter ThemeMode para uma string legível
  String _getThemeModeString(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return 'Claro';
      case ThemeMode.dark:
        return 'Escuro';
      case ThemeMode.system:
        return 'Padrão do Sistema';
    }
  }

  // Método para mostrar o diálogo de seleção de tema
  void _showThemeDialog(BuildContext context, ThemeProvider themeProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Escolha o Tema'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<ThemeMode>(
                title: const Text('Claro'),
                value: ThemeMode.light,
                groupValue: themeProvider.themeMode,
                onChanged: (ThemeMode? value) {
                  if (value != null) {
                    themeProvider.setThemeMode(value);
                  }
                  Navigator.pop(context);
                },
              ),
              RadioListTile<ThemeMode>(
                title: const Text('Escuro'),
                value: ThemeMode.dark,
                groupValue: themeProvider.themeMode,
                onChanged: (ThemeMode? value) {
                  if (value != null) {
                    themeProvider.setThemeMode(value);
                  }
                  Navigator.pop(context);
                },
              ),
              RadioListTile<ThemeMode>(
                title: const Text('Padrão do Sistema'),
                value: ThemeMode.system,
                groupValue: themeProvider.themeMode,
                onChanged: (ThemeMode? value) {
                  if (value != null) {
                    themeProvider.setThemeMode(value);
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
