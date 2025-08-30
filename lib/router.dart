import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/cadastro_screen.dart';
import 'package:myapp/home_screen.dart';
import 'package:myapp/login_screen.dart';
import 'package:myapp/profile_screen.dart'; // Corrigido: importando o arquivo correto
import 'package:myapp/splash_screen.dart';

// Configuração do GoRouter
final GoRouter router = GoRouter(
  initialLocation: '/', // Começa na SplashScreen
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/cadastro',
      builder: (BuildContext context, GoRouterState state) {
        return const CadastroScreen();
      },
    ),
    // A HomeScreen é a rota principal após o login
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      // A tela de perfil é uma sub-rota da home
      routes: [
        GoRoute(
          path: 'perfil', // O path é relativo: /home/perfil
          builder: (BuildContext context, GoRouterState state) {
            // Corrigido: usando a tela correta
            return const ProfileScreen();
          },
        ),
      ]
    ),
  ],
);
