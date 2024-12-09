import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DashboardController extends GetxController {
  var salesSummary = {}.obs;

  @override
  void onInit() {
    fetchSalesSummary();
    super.onInit();
  }

  Future<void> fetchSalesSummary() async {
    try {
      final response =
          await http.get(Uri.parse('http://127.0.0.1:8000/api/dashboard'));
      if (response.statusCode == 200) {
        salesSummary.value = jsonDecode(response.body);
      }
    } catch (e) {
      print('Error fetching sales summary');
    }
  }
}
