import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class CadastroScreen extends StatelessWidget {
  const CadastroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      appBar: AppBar(
        title: Text(
          'TELA DE CADASTRO',
          style: GoogleFonts.oswald(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.grey[400],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.camera_alt, color: Theme.of(context).colorScheme.primary),
                    onPressed: () {
                      // TODO: Implementar seleção de imagem
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildTextField(label: 'Nome'),
              const SizedBox(height: 16),
              _buildTextField(label: 'E-mail', keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 16),
              _buildTextField(label: 'Endereço'),
              const SizedBox(height: 16),
              _buildTextField(label: 'Complemento'),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navega para a home após o cadastro
                    context.go('/home');
                  },
                  child: const Text('Cadastrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, TextInputType? keyboardType}) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}
