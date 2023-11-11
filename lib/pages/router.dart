import 'package:SerManos/pages/routes/home.dart';
import 'package:SerManos/pages/routes/login.dart';
import 'package:SerManos/pages/routes/register.dart';
import 'package:SerManos/pages/routes/start.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SerManosRouter {
  static final List<String> nonAuthRoutes = [
    '/',
    '/start',
    '/start/register',
    '/start/login',
  ];

  final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', redirect: (context, state) => '/home'),
      GoRoute(
        name: 'start',
        path: '/start',
        builder: (context, state) => const Start(),
        routes: [
          GoRoute(
            name: 'register',
            path: 'register',
            builder: (context, state) => const Register(),
          ),
          GoRoute(
            name: 'login',
            path: 'login',
            builder: (context, state) => const Login(),
          ),
        ],
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => const Home(),
      )
    ],
    errorBuilder: (context, state) => Text('Error: ${state.error}'),
    redirect: (context, state) => '/start/login',
  );
}
