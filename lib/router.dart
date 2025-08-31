
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/cadastro_screen.dart';
import 'package:myapp/editar_perfil_screen.dart'; // Importa a nova tela
import 'package:myapp/home_screen.dart';
import 'package:myapp/login_screen.dart';
import 'package:myapp/novo_agendamento_screen.dart';
import 'package:myapp/splash_screen.dart';

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
    GoRoute(
      path: '/novo-agendamento',
      builder: (BuildContext context, GoRouterState state) {
        return const NovoAgendamentoScreen();
      },
    ),
    // Nova rota para a tela de edição de perfil
    GoRoute(
      path: '/editar-perfil',
      builder: (BuildContext context, GoRouterState state) {
        return const EditarPerfilScreen();
      },
    ),
  ],
);
