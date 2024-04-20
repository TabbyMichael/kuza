import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kuza/data/database_helper.dart';
import 'package:kuza/models/products.dart';

class EditProductPage extends StatefulWidget {
  final Product product;

  const EditProductPage({Key? key, required this.product}) : super(key: key);

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  late TextEditingController _productNameController;
  late TextEditingController _quantityController;
  late TextEditingController _skuController;
  late TextEditingController _barcodeController;
  late TextEditingController _sellingPriceController;
  late File? _image;
  final ImagePicker _picker = ImagePicker();
  late DatabaseHelper _databaseHelper;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _productNameController =
        TextEditingController(text: widget.product.productName);
    _quantityController =
        TextEditingController(text: widget.product.quantity.toString());
    _skuController = TextEditingController(text: widget.product.sku);
    _barcodeController = TextEditingController(text: widget.product.barcode);
    _sellingPriceController =
        TextEditingController(text: widget.product.sellingPrice.toString());
    _image = widget.product.image != null ? File(widget.product.image!) : null;
    _databaseHelper = DatabaseHelper();
  }

  Future<void> _updateProduct() async {
    if (_formKey.currentState!.validate()) {
      Product updatedProduct = Product(
        id: widget.product.id,
        productName: _productNameController.text,
        quantity: int.parse(_quantityController.text),
        sku: _skuController.text,
        barcode: _barcodeController.text,
        sellingPrice: double.parse(_sellingPriceController.text),
        image: _image?.path,
      );

      try {
        await _databaseHelper.updateProduct(updatedProduct);
        Navigator.pop(context);
      } catch (e) {
        print('Error updating product: $e');
      }
    }
  }

  Future<void> _getImage() async {
    try {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxWidth: 800,
        maxHeight: 600,
      );
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
        title: const Text('Edit Product'),
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
                      : widget.product.image != null
                          ? Image.file(
                              File(widget.product.image!),
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
                  onPressed: _updateProduct,
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
