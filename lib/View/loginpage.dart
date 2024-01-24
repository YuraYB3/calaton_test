import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ModelView/colorsservice.dart';
import '../ModelView/login_viewmodel.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<LoginViewModel>(context, listen: true);
    ColorService colorService = ColorService();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorService.backgroundColor,
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
                    color: colorService.backgroundColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    emailField(viewModel),
                    passwordField(viewModel),
                    loginButton(viewModel, context, colorService),
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
        decoration: const InputDecoration(
            labelText: 'Email',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.amberAccent),
            ),
            labelStyle: TextStyle(
              color: Colors.amberAccent,
            )),
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
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.amberAccent),
            ),
            labelStyle: TextStyle(
              color: Colors.amberAccent,
            )),
      ));
}

SizedBox loginButton(
    LoginViewModel viewModel, BuildContext context, ColorService colorService) {
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
      child: Text(
        'LOGIN',
        style: TextStyle(color: colorService.backgroundColor),
      ),
    ),
  );
}
