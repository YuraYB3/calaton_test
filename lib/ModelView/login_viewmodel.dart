import 'package:flutter/material.dart';

import 'inputservice.dart';
import 'navigationservice.dart';
import 'userdatastorage.dart';

class LoginViewModel extends ChangeNotifier {
  late UserDataStorage _userDataStorage;
  late InputValidator _inputValidator;
  late NavigationService _navigationService;

  String _email = '';
  String _password = '';

  String get email => _email;
  String get password => _password;

  LoginViewModel() {
    _userDataStorage = UserDataStorage();
    _inputValidator = InputValidator();
    _navigationService = NavigationService();
    _init();
  }

  Future<void> _init() async {
    await _userDataStorage.initPrefs();
  }

  void updateEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    _password = value;
    notifyListeners();
  }

  Future<void> validateAndNavigate(
      BuildContext context, String email, String password) async {
    if (_inputValidator.isNotEmpty(email) &&
        _inputValidator.isNotEmpty(password)) {
      await _userDataStorage.saveUserData(email, password);
      _navigationService.navigateToHomePage(context);
    } else {
      // ignore: avoid_print
      print('object');
    }
  }
}
