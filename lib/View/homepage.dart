// second_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ModelView/apiservice.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late ApiService _apiService;
  List<Map<String, String>> dataList = [];

  @override
  void initState() {
    super.initState();
    _apiService = Provider.of<ApiService>(context, listen: false);
    fetchData();
  }

  Future<void> fetchData() async {
    List<Map<String, String>> newData = await _apiService.fetchData();
    setState(() {
      dataList = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: dataList.isEmpty
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(dataList[index]['name'] ?? ''),
                    subtitle: Text(dataList[index]['email'] ?? ''),
                  );
                },
              ),
      ),
    );
  }
}
