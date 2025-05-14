import 'package:flutter/material.dart';
import 'welcome_screen.dart'; // Importamos la nueva pantalla
import 'screens/login_screen.dart'; // en lugar de solo 'login_screen.dart'


void main() {
  runApp(const AppUcol());
}

class AppUcol extends StatelessWidget {
  const AppUcol({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App UCOL',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}
