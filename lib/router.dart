import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/cadastro_screen.dart';
import 'package:myapp/home_screen.dart';
import 'package:myapp/login_screen.dart';
import 'package:myapp/splash_screen.dart';

// Configuração do GoRouter
final GoRouter router = GoRouter(
  initialLocation: '/',
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
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
  ],
);
