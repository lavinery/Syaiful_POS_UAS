import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var errorMessage = ''.obs;
  var isLoading = false.obs;

  Future<void> login() async {
    // Validasi input untuk memastikan username dan password tidak kosong
    if (username.value.isEmpty || password.value.isEmpty) {
      errorMessage.value = 'Username dan password tidak boleh kosong';
      return;
    }

    // Menandakan bahwa proses login sedang berlangsung
    isLoading.value = true;

    try {
      // Mengirim request POST ke endpoint login API Laravel
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/login'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'username': username.value,
          'password': password.value,
        },
      );

      // Menangani response dari server
      if (response.statusCode == 200) {
        // Jika login berhasil, redirect ke halaman dashboard
        Get.offNamed('/dashboard');
      } else {
        // Jika login gagal, tampilkan pesan error
        errorMessage.value = 'Username atau password salah';
      }
    } catch (e) {
      // Tangani error jaringan atau kesalahan lain
      errorMessage.value = 'Terjadi kesalahan';
    } finally {
      // Matikan indikator loading
      isLoading.value = false;
    }
  }
}
