import 'package:burgan_assistant/pages/Balance_page.dart';
import 'package:burgan_assistant/pages/home_page.dart';
import 'package:burgan_assistant/pages/login_page.dart';
import 'package:burgan_assistant/pages/Financing_page.dart';
import 'package:burgan_assistant/pages/MainPage.dart';
import 'package:burgan_assistant/pages/register_page.dart';
import 'package:burgan_assistant/providers/auth_provider.dart';
import 'package:burgan_assistant/providers/stocks_provider.dart';
import 'package:burgan_assistant/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:burgan_assistant/providers/stocks_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<StocksProvider>(create: (_) => StocksProvider()),
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
        builder: (context, state) => RegisterPage(),
      ),
      GoRoute(
        path: '/home',
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
      GoRoute(
        path: '/balance',
        builder: (context, state) => MainPage(),
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
