import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrocasScreen extends StatelessWidget {
  const TrocasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trocas',
           style: GoogleFonts.oswald(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Em construção...'),
      ),
    );
  }
}
