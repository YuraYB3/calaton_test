import 'package:flutter/material.dart';

import 'View/homepage.dart';
import 'View/loginpage.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/homepage': (context) => HomePage(),
      },
    );
  }
}
