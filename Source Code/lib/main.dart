import 'package:flutter/material.dart';
import 'homepage.dart';
import 'kalkulator.dart';
import 'profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Navigator',
      initialRoute: '/',
      routes: {
        '/': (context) => const Homepage(),
        '/profile': (context) => const ProfilePage(),
        '/kalkulator': (context) => const KalkulatorSederhana(),
      },
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const Homepage();
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfilePage();
  }
}

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({super.key});

  @override