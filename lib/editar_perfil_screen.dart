
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class EditarPerfilScreen extends StatefulWidget {
  const EditarPerfilScreen({super.key});

  @override
  State<EditarPerfilScreen> createState() => _EditarPerfilScreenState();
}

class _EditarPerfilScreenState extends State<EditarPerfilScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _addressController; // Novo controller para endereço
  late TextEditingController _phoneController;   // Novo controller para telefone

  @override
  void initState() {
    super.initState();
    // Pré-popula os campos com os dados atuais (mock)
    _nameController = TextEditingController(text: 'Luiz Litterbug');
    _emailController = TextEditingController(text: 'luiz.litterburg@email.com');
    _addressController = TextEditingController(text: 'Rua Uruguai, 458, Santa Catarina, SC');
    _phoneController = TextEditingController(text: '(47) 99999-8888');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose(); // Descarta o novo controller
    _phoneController.dispose();   // Descarta o novo controller
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // Lógica de salvamento (mock)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Perfil atualizado com sucesso!')),
      );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F0),
      appBar: AppBar(
        title: Text(
          'Editar Perfil',
          style: GoogleFonts.oswald(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              _buildTextField(
                controller: _nameController,
                label: 'Nome Completo',
                icon: Icons.person_outline,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Por favor, insira seu nome.';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              _buildTextField(
                controller: _emailController,
                label: 'E-mail',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || !value.contains('@')) return 'Por favor, insira um e-mail válido.';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              // Campo de Telefone Adicionado
              _buildTextField(
                controller: _phoneController,
                label: 'Telefone',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Por favor, insira seu telefone.';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              // Campo de Endereço Adicionado
              _buildTextField(
                controller: _addressController,
                label: 'Endereço',
                icon: Icons.location_on_outlined,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Por favor, insira seu endereço.';
                  return null;
                },
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _saveProfile,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Salvar Alterações'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Theme.of(context).colorScheme.primary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
        ),
      ),
    );
  }
}
