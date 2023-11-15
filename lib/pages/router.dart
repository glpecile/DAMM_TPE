import 'package:SerManos/pages/routes/news_detail.dart';
import 'package:SerManos/pages/routes/home.dart';
import 'package:SerManos/pages/routes/login.dart';
import 'package:SerManos/pages/routes/register.dart';
import 'package:SerManos/pages/routes/start.dart';
import 'package:SerManos/pages/routes/welcome.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'routes/edit_profile.dart';

class SerManosRouter {
  static final List<String> nonAuthRoutes = [
    '/',
    '/start',
    '/start/register',
    '/start/login',
  ];

  final GoRouter router = GoRouter(
      initialLocation: '/welcome',
      routes: <RouteBase>[
        GoRoute(path: '/', redirect: (context, state) => '/home'),
        GoRoute(
          name: 'start',
          path: '/start',
          builder: (context, state) => const Start(),
          routes: <RouteBase>[
            GoRoute(
              name: Register.name,
              path: Register.path,
              builder: (context, state) => const Register(),
            ),
            GoRoute(
              name: Login.name,
              path: Login.path,
              builder: (context, state) => const Login(),
            ),
          ],
        ),
        GoRoute(
          name: Home.name,
          path: Home.path,
          builder: (context, state) => const Home(),
          routes: <RouteBase> [
            GoRoute(
              name: EditProfile.name,
              path: EditProfile.path,
              builder: (context, state) => EditProfile(),
            ),
            GoRoute(
                name: NewsDetail.name,
                path: NewsDetail.path,
                builder: (context, state) => const NewsDetail(),
            ),
          ]
        ),
        GoRoute(
            name: Welcome.name,
            path: Welcome.path,
            builder: (context, state) => const Welcome(),
        )
      ],
      errorBuilder: (context, state) => Text('Error: ${state.error}'),
      // TODO: add auth redirect
      debugLogDiagnostics: true);
}
