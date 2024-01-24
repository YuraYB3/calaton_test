import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Services/api_service.dart';
import 'ViewModel/login_viewmodel.dart';
import 'ViewModel/wrapper.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ApiService()),
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
      ],
      child: const Wrapper(),
    ),
  );
}
