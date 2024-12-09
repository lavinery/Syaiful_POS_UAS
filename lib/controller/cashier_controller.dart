import 'package:get/get.dart';
import '../models/product.dart';

class CashierController extends GetxController {
  var productList = <Product>[].obs;
  var totalPrice = 0.0.obs;

  void addProduct(String name, double price) {
    productList.add(Product(name: name, price: price));
    totalPrice.value += price;
  }

  void completeTransaction() {
    productList.clear();
    totalPrice.value = 0.0;
    Get.snackbar('Success', 'Transaction completed');
  }
}
