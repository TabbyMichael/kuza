import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kuza/data/database_helper.dart';
import 'package:kuza/models/products.dart';

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
  File? _image;
  final ImagePicker _picker = ImagePicker();
  late DatabaseHelper _databaseHelper;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        image: _image?.path,
      );

      try {
        await _databaseHelper.insertProduct(newProduct);
        Navigator.pop(context);
      } catch (e) {
        print('Error saving product: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving product: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _getImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    } catch (e) {
      print('Error picking image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error picking image: $e'),
          backgroundColor: Colors.red,
        ),
      );
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
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _getImage,
                  child: _image != null
                      ? Image.file(
                          _image!,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          height: 150,
                          width: 150,
                          color: Colors.grey[200],
                          child: Icon(
                            Icons.add_photo_alternate,
                            size: 50,
                            color: Colors.grey[800],
                          ),
                        ),
                ),
                const SizedBox(height: 16.0),
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid quantity';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid barcode';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid selling price';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _saveProduct,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 167, 222, 248),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
