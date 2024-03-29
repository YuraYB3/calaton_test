import 'package:flutter/material.dart';

import '../View/home_page.dart';
import '../View/login_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/homepage': (context) => const HomePage(),
      },
    );
  }
}
