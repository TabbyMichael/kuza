import 'package:flutter/material.dart';

class DataOverviewWidget extends StatelessWidget {
  const DataOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Top Products",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            _buildProductRow(
                "Panadol",
                "white ", // Inventory details on the left
                "Sales Today",
                "Ksh 2,600",
                "Ksh 300,000"),
            _buildProductRow(
                "Mara moja",
                "white - 500 boxes", // Inventory details on the left
                "Sales Today",
                "Ksh 1,200",
                "Ksh 100,000"),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildProductRow(String productName, String inventory,
      String priceTodayTitle, String priceToday, String totalPrice) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          productName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 4),
        Text(inventory),
        _buildDataRow(priceTodayTitle, priceToday),
        _buildDataRow("Total Sales", totalPrice),
        const Divider(),
      ],
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Data Overview'),
        ),
        body: const DataOverviewWidget(),
      ),
    ),
  );
}
