import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Model/user_model.dart';
import 'errorservice.dart';

class ApiService extends ChangeNotifier {
  ErrorService errorService = ErrorService();
  Future<List<Map<String, String>>> fetchData() async {
    late Dio dio;
    dio = Dio();
    try {
      var apiUrl = 'https://jsonplaceholder.typicode.com/users';
      var response = await dio.get(apiUrl);

      List<UserModel> users = (response.data as List)
          .map((json) => UserModel.fromJson(json))
          .toList();

      return users
          .map((user) => {'name': user.name, 'email': user.email})
          .toList();
    } catch (error) {
      return [];
    }
  }
}
