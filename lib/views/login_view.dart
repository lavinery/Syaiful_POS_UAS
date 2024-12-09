import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/controller/login_controller.dart';

class LoginView extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => loginController.username.value = value,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              onChanged: (value) => loginController.password.value = value,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            Obx(() {
              return loginController.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: loginController.login,
                      child: Text('Login'),
                    );
            }),
            SizedBox(height: 10),
            Obx(() {
              return Text(
                loginController.errorMessage.value,
                style: TextStyle(color: Colors.red),
              );
            }),
          ],
        ),
      ),
    );
  }
}
