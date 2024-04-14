import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kuza/data/database_helper.dart';
import 'package:kuza/models/products.dart'; // Import package for date formatting

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _skuController = TextEditingController();
  final TextEditingController _barcodeController = TextEditingController();
  final TextEditingController _sellingPriceController = TextEditingController();
  late DatabaseHelper _databaseHelper;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Form key

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
  }

  Future<void> _saveProduct() async {
    if (_formKey.currentState!.validate()) {
      Product newProduct = Product(
        productName: _productNameController.text,
        quantity: int.parse(_quantityController.text),
        sku: _skuController.text,
        barcode: _barcodeController.text,
        sellingPrice: double.parse(_sellingPriceController.text),
      );

      try {
        // Insert the new product into the database
        await _databaseHelper.insertProduct(newProduct);

        // Navigate back to the previous screen
        Navigator.pop(context);
      } catch (e) {
        // Handle database insertion error
        print('Error saving product: $e');
        // Optionally, display an error message to the user
        // Or perform other error handling actions
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        backgroundColor: const Color.fromARGB(255, 167, 222, 248),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, // Assign form key
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Product Name',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  controller: _productNameController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Quantity',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  controller: _quantityController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Quantity',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter quantity';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'SKU',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  controller: _skuController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter SKU',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter SKU';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Barcode',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  controller: _barcodeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Barcode',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter barcode';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Selling Price',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  controller: _sellingPriceController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Selling Price',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter selling price';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _saveProduct,
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
