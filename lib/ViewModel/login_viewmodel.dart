import 'package:flutter/material.dart';

import '../Utils/notifications.dart';
import '../Utils/input_service.dart';
import 'navigation_service.dart';
import '../Services/user_data_storage.dart';

class LoginViewModel extends ChangeNotifier {
  late UserDataStorage _userDataStorage;
  late InputValidator _inputValidator;
  late NavigationService _navigationService;
  NotificationsHelper errorService = NotificationsHelper();

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
    if (_inputValidator.isEmailValid(email) &&
        _inputValidator.isPasswordValid(password)) {
      try {
        await _userDataStorage.saveUserData(email, password);
        _navigationService.navigateToHomePage(context);
      } catch (e) {
        errorService.show(context, 'Couldnt save your data');
      }
    } else {
      errorService.show(
          context, 'Please fill in both email and password fields.');
    }
  }
}
