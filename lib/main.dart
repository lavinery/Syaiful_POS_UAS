import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_mobile/controllers/auth_controller.dart';
import 'package:pos_mobile/views/dashboard_view.dart';
import 'package:pos_mobile/views/login_view.dart';
import 'package:pos_mobile/views/register_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'POS System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginView()),
        GetPage(name: '/register', page: () => RegisterView()),
        GetPage(name: '/dashboard', page: () => DashboardView()),
      ],
    );
  }
}