import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ModelView/apiservice.dart';
import 'ModelView/login_viewmodel.dart';
import 'ModelView/wrapper.dart';

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
