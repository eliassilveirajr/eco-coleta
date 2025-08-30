import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/agendamento_screen.dart';
import 'package:myapp/cadastro_screen.dart';
import 'package:myapp/configuracoes_screen.dart';
import 'package:myapp/home_screen.dart';
import 'package:myapp/login_screen.dart';
import 'package:myapp/novo_agendamento_screen.dart';
import 'package:myapp/profile_screen.dart';
import 'package:myapp/splash_screen.dart';
import 'package:myapp/trocas_screen.dart';

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
        // As telas de perfil e trocas são sub-rotas da home
        routes: [
          GoRoute(
            path: 'perfil', // O path é relativo: /home/perfil
            builder: (BuildContext context, GoRouterState state) {
              return const ProfileScreen();
            },
          ),
          GoRoute(
            path: 'trocas', // O path é relativo: /home/trocas
            builder: (BuildContext context, GoRouterState state) {
              return const TrocasScreen();
            },
          ),
          GoRoute(
            path: 'configuracoes', // O path é relativo: /home/configuracoes
            builder: (BuildContext context, GoRouterState state) {
              return const ConfiguracoesScreen();
            },
          ),
          GoRoute(
              path: 'agendamento', // O path é relativo: /home/agendamento
              builder: (BuildContext context, GoRouterState state) {
                return const AgendamentoScreen();
              },
              routes: [
                GoRoute(
                  path: 'novo', // O path é relativo: /home/agendamento/novo
                  builder: (BuildContext context, GoRouterState state) {
                    return const NovoAgendamentoScreen();
                  },
                ),
              ]),
        ]),
  ],
);
