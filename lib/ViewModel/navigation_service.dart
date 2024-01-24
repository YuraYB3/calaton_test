import 'package:flutter/material.dart';

class NavigationService {
  void navigateToHomePage(BuildContext context) {
    Navigator.pushNamed(context, '/homepage');
  }
}
