import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ModelView/login_viewmodel.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<LoginViewModel>(context, listen: true);

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
                    emailField(viewModel),
                    passwordField(viewModel),
                    loginButton(viewModel, context),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox emailField(LoginViewModel viewModel) {
    return SizedBox(
      width: 250,
      child: TextField(
        onChanged: (value) => viewModel.updateEmail(value),
        decoration: const InputDecoration(labelText: 'Email'),
      ),
    );
  }
}

SizedBox passwordField(LoginViewModel viewModel) {
  return SizedBox(
    width: 250,
    child: TextField(
      obscureText: true,
      onChanged: (value) => viewModel.updatePassword(value),
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
    ),
  );
}

SizedBox loginButton(LoginViewModel viewModel, BuildContext context) {
  return SizedBox(
    width: 250,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      onPressed: () async {
        await viewModel.validateAndNavigate(
          context,
          viewModel.email,
          viewModel.password,
        );
      },
      child: const Text(
        'LOGIN',
        style:
            TextStyle(color: Color.fromARGB(255, 19, 168, 123), fontSize: 16),
      ),
    ),
  );
}
