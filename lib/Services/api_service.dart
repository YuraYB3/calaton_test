import 'package:calaton_test/Model/user_model.dart';
import 'package:calaton_test/Services/user_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Utils/notifications.dart';

class ApiService extends ChangeNotifier {
  NotificationsHelper errorService = NotificationsHelper();
  Future<List<UserModel>> fetchData() async {
    late Dio dio;
    dio = Dio();
    var apiUrl = 'https://jsonplaceholder.typicode.com/users';
    List<UserModel> users = [];
    try {
      var response = await dio.get(apiUrl);

      users = (response.data as List)
          .map((json) => UserResponse.fromJson(json))
          .map((user) => UserModel(email: user.email, name: user.name))
          .toList();
    } catch (error) {
      //Do nothing for now
    }
    return users;
  }
}
