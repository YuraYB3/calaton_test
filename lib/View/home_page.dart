// second_page.dart
import 'package:calaton_test/Model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Services/api_service.dart';
import '../Utils/colors_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late ApiService _apiService;
  List<UserModel> dataList = [];
  ColorService colorService = ColorService();

  @override
  void initState() {
    super.initState();
    _apiService = Provider.of<ApiService>(context, listen: false);
    fetchData();
  }

  Future<void> fetchData() async {
    List<UserModel> newData = await _apiService.fetchData();
    setState(() {
      dataList = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorService.backgroundColor,
      ),
      body: Center(
        child: dataList.isEmpty
            ? const CircularProgressIndicator(
                color: Colors.amber,
              )
            : listOfUsersWidget(),
      ),
    );
  }

  ListView listOfUsersWidget() {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            dataList[index].email,
            style: const TextStyle(color: Colors.black),
          ),
          subtitle: Text(
            dataList[index].name,
            style: const TextStyle(color: Colors.grey),
          ),
        );
      },
    );
  }
}
