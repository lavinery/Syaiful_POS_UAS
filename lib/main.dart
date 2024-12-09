import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/login_view.dart';
import 'views/dashboard_view.dart';
import 'views/cashier_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginView()),
        GetPage(name: '/dashboard', page: () => DashboardView()),
        GetPage(name: '/cashier', page: () => CashierView()),
      ],
    );
  }
}
