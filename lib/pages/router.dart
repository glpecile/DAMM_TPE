import 'package:SerManos/pages/routes/volunteerings_detail.dart';
import 'package:SerManos/pages/routes/edit_profile.dart';
import 'package:SerManos/pages/routes/home.dart';
import 'package:SerManos/pages/routes/login.dart';
import 'package:SerManos/pages/routes/news_detail.dart';
import 'package:SerManos/pages/routes/register.dart';
import 'package:SerManos/pages/routes/welcome.dart';
import 'package:SerManos/pages/routes/start.dart';
import 'package:SerManos/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  final List<String> nonAuthRoutes = [
    '/',
    '/start',
    '/start/register',
    '/start/login',
  ];

  final GoRouter router = GoRouter(
      initialLocation: Home.path,
      routes: <RouteBase>[
        GoRoute(path: '/', redirect: (context, state) => '/home'),
        GoRoute(
          name: Start.name,
          path: Start.path,
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
            routes: <RouteBase>[
              GoRoute(
                name: EditProfile.name,
                path: EditProfile.path,
                builder: (context, state) => const EditProfile(),
              ),
              GoRoute(
                name: NewsDetail.name,
                path: NewsDetail.path,
                builder: (context, state) =>
                    NewsDetail(id: state.pathParameters['newsId']!),
              ),
              GoRoute(
                name: CardDetail.name,
                path: CardDetail.path,
                builder: (context, state) =>
                    CardDetail(id: state.pathParameters['volunteeringId']!),
              )
            ]),
        GoRoute(
          name: Welcome.name,
          path: Welcome.path,
          builder: (context, state) => const Welcome(),
        )
      ],
      redirect: (context, state) async {
        var currentUser = ref.watch(authControllerProvider).value;
        final bool isAuthlessRoute =
            nonAuthRoutes.any((element) => element == state.uri.path);
        final bool isLoggedIn = currentUser != null;

        if (isAuthlessRoute && isLoggedIn) {
          return Home.path;
        } else if (isLoggedIn) {
          return null;
        }

        return isAuthlessRoute ? null : "/start";
      },
      errorBuilder: (context, state) => Text('Error: ${state.error}'),
      debugLogDiagnostics: true);

  return router;
}
