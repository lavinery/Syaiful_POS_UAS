import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/controller/cashier_controller.dart';
import '../widgets/sidebar.dart';

class CashierView extends StatelessWidget {
  final CashierController controller = Get.put(CashierController());

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController priceController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Cashier')),
      drawer: Sidebar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                controller.addProduct(
                  nameController.text,
                  double.parse(priceController.text),
                );
                nameController.clear();
                priceController.clear();
              },
              child: Text('Add Product'),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.productList.length,
                  itemBuilder: (context, index) {
                    final product = controller.productList[index];
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text('\$${product.price}'),
                    );
                  },
                ),
              ),
            ),
            Obx(() => Text('Total: \$${controller.totalPrice}')),
            ElevatedButton(
              onPressed: controller.completeTransaction,
              child: Text('Complete Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
