import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Model/user_model.dart';

class ApiService extends ChangeNotifier {
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
      // ignore: avoid_print
      print('Error fetching data: $error');
      return [];
    }
  }
}
