import 'package:flutter/material.dart';
import 'package:kuza/data/database_helper.dart';
import 'package:kuza/models/suppliers.dart';
import 'package:kuza/pages/home_page.dart';

class AddSupplierPage extends StatefulWidget {
  const AddSupplierPage({Key? key}) : super(key: key);

  @override
  _AddSupplierPageState createState() => _AddSupplierPageState();
}

class _AddSupplierPageState extends State<AddSupplierPage> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  final TextEditingController supplierNameController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();

  @override
  void dispose() {
    supplierNameController.dispose();
    phoneNoController.dispose();
    emailAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Supplier',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 167, 222, 248),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              _customInputField(supplierNameController, 'Supplier Name',
                  'Enter Supplier Name'),
              const SizedBox(height: 16.0),
              _customInputField(phoneNoController, 'Phone No', 'Enter Phone No',
                  TextInputType.phone),
              const SizedBox(height: 16.0),
              _customInputField(emailAddressController, 'Email Address',
                  'Enter Email Address', TextInputType.emailAddress),
              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      Supplier supplier = Supplier(
                        supplierName: supplierNameController.text,
                        contactPerson: phoneNoController.text,
                        contactNo: phoneNoController.text,
                        emailAddress: emailAddressController.text,
                      );
                      await dbHelper.insertSupplier(supplier);

                      // Update the state to refresh the UI
                      setState(() {});

                      Navigator.pop(context); // Close the page
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical:
                              6), // Increase padding to increase button size
                      minimumSize: const Size(
                          120, 50), // Set minimum size to increase button size
                      backgroundColor: const Color.fromARGB(255, 167, 222, 248),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 26, // Increased font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _customInputField(
      TextEditingController controller, String header, String hintText,
      [TextInputType keyboardType = TextInputType.text]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black),
        ),
        const SizedBox(height: 8.0),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.lightBlueAccent,
                width: 2.0,
              ),
            ),
            filled: true,
          ),
        ),
      ],
    );
  }
}
