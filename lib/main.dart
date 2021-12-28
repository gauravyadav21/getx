import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/binding.dart';
import 'package:task/screens/my_home_page.dart';
import 'package:task/screens/my_home_page_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      getPages: [
        GetPage(name: '/home', page: () => const  MyHomePage(), binding: BindingsBuilder.put(() => MyHomePageController()))
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
