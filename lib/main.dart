import 'package:burgan_assistant/home_page.dart';
import 'package:burgan_assistant/login_page.dart';
import 'package:burgan_assistant/providers/auth_provider.dart';
import 'package:burgan_assistant/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // themeMode: ThemeMode.light,
      // darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => SignupPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),
      // GoRoute(
      //   path: '/update/:tipId',
      //   builder: (context, state) {
      //     final pet = Provider.of<TipsProvider>(context).tips.firstWhere(
      //         (pet) => pet.id.toString() == (state.pathParameters['petId']!));
      //     return UpdatePage(pet: pet);
      //   },
      // ),
    ],
  );
}
