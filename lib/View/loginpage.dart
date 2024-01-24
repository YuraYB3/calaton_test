import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 19, 168, 123),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 19, 168, 123),
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    emailField(),
                    passwordField(),
                    loginButton(context),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox emailField() {
    return const SizedBox(
      width: 250,
      child: TextField(
        decoration: InputDecoration(labelText: 'Email'),
      ),
    );
  }
}

SizedBox passwordField() {
  return const SizedBox(
    width: 250,
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
      ),
    ),
  );
}

SizedBox loginButton(BuildContext context) {
  return SizedBox(
    width: 250,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      onPressed: () async {},
      child: const Text(
        'LOGIN',
        style:
            TextStyle(color: Color.fromARGB(255, 19, 168, 123), fontSize: 16),
      ),
    ),
  );
}
