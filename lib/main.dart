import 'package:flutter/material.dart';

import 'core/constants/colors.dart';
import 'core/extension/context_extension.dart';
import 'features/auth/views/login/login_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    osSetStatusBarColor(statusBarColor: ColorsConstants.transparent);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive - Login || Register',
      home: LoginView(),
    );
  }
}
