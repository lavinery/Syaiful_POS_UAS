import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/controller/dashboard_controller.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardView extends StatelessWidget {
  final DashboardController dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() {
              return dashboardController.salesSummary.isEmpty
                  ? CircularProgressIndicator()
                  : Column(
                      children: [
                        Text(
                            'Total Penjualan: ${dashboardController.salesSummary['total_sales']}'),
                        SizedBox(height: 20),
                        LineChart(
                          LineChartData(
                            lineBarsData: [
                              LineChartBarData(
                                spots: [
                                  FlSpot(0, 1),
                                  FlSpot(1, 3),
                                  FlSpot(2, 1),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
            }),
          ],
        ),
      ),
    );
  }
}
