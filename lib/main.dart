import 'package:flutter/material.dart';
import 'package:flutter_pas/routes.dart';
import 'package:flutter_pas/login_page.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "My Learning App",
      initialRoute: Routes.loginpage,
      getPages: Routes.myPages,
    );
  }
}