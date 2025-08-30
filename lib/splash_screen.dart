import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
      // Correção: Usando pushReplacement para evitar loops de redirecionamento.
      () => context.pushReplacement('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( 
        children: [
          Image.asset(
            'assets/images/splash.png', 
            fit: BoxFit.cover,          
            width: double.infinity,     
            height: double.infinity,    
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end, 
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 50.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
