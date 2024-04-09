// import 'package:flutter/material.dart';
// import 'package:medfast_go/pages/home_page.dart';

// class Products extends StatelessWidget {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController quantityController = TextEditingController();
//   final TextEditingController skuController = TextEditingController();
//   final TextEditingController barcodeController = TextEditingController();
//   final TextEditingController sellingPriceController = TextEditingController();

//   void _showProductForm(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         return Container(
//           height: MediaQuery.of(context).size.height * 0.947,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 20.0),
//                   _customInputField(
//                       nameController, 'Product Name', 'Enter Product Name'),
//                   const SizedBox(height: 16.0),
//                   _customInputField(quantityController, 'Quantity in Stock',
//                       'Enter Quantity', TextInputType.number),
//                   const SizedBox(height: 16.0),
//                   _customInputField(skuController, 'SKU', 'Enter SKU'),
//                   const SizedBox(height: 16.0),
//                   _customInputField(barcodeController, 'Barcode',
//                       'Enter Barcode', TextInputType.number),
//                   const SizedBox(height: 16.0),
//                   _customInputField(
//                       sellingPriceController,
//                       'Selling Price',
//                       'Enter Selling Price',
//                       const TextInputType.numberWithOptions(decimal: true)),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _showMenuContainer(BuildContext context) {
//     showGeneralDialog(
//       context: context,
//       barrierDismissible: true,
//       barrierLabel: "Dismiss",
//       barrierColor: Colors.black.withOpacity(0.5),
//       transitionDuration: const Duration(milliseconds: 300),
//       pageBuilder: (context, anim1, anim2) {
//         return Align(
//           alignment: Alignment.topCenter,
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height * 0.32,
//             margin: const EdgeInsets.only(top: 50, left: 16.0, right: 16.0),
//             padding: const EdgeInsets.all(16.0),
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(
//                 Radius.circular(8.0),
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.only(top: 20.0),
//                   child: Text(
//                     'Product List',
//                     style: TextStyle(
//                         fontSize: 24.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                         decoration: TextDecoration.none),
//                   ),
//                 ),
//                 const SizedBox(height: 30.0),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton.icon(
//                     onPressed: () {
//                       // Action for exporting to PDF/Excel
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.lightBlueAccent,
//                       textStyle: const TextStyle(
//                         fontSize: 20,
//                       ),
//                     ),
//                     icon: const Icon(Icons.insert_drive_file),
//                     label: const Text(
//                       'Export as PDF/Excel',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20.0),
//                 const Divider(
//                     height: 30.0,
//                     thickness: 1.0,
//                     indent: 20.0,
//                     endIndent: 20.0), // This is the underline
//                 const Spacer(), // Pushes the next widget to the end
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context); // To close the dialog
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red,
//                       textStyle: const TextStyle(fontSize: 20),
//                     ),
//                     child: const Text(
//                       'Close',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//       transitionBuilder: (context, anim1, anim2, child) {
//         return SlideTransition(
//           position: Tween(begin: const Offset(0, -1), end: const Offset(0, 0))
//               .animate(anim1),
//           child: child,
//         );
//       },
//     );
//   }

//   Widget _customInputField(
//       TextEditingController controller, String header, String hintText,
//       [TextInputType keyboardType = TextInputType.text]) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           header,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20.0,
//           ),
//         ),
//         const SizedBox(height: 8.0),
//         TextField(
//           controller: controller,
//           keyboardType: keyboardType,
//           decoration: InputDecoration(
//             hintText: hintText,
//             fillColor: Colors.white,
//             contentPadding: EdgeInsets.symmetric(
//               vertical: (header == 'Product Name') ? 35.0 : 20.0,
//               horizontal: 10.0,
//             ),
//             border: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.grey[300]!),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.grey[300]!),
//             ),
//             focusedBorder: const OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Colors.lightBlueAccent,
//                 width: 2.0,
//               ),
//             ),
//             filled: true,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget buildEmptyMessage(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         height: MediaQuery.of(context).size.height *
//             0.4, // 40% of the screen height
//         padding: const EdgeInsets.all(16.0),
//         margin: const EdgeInsets.all(16.0),
//         decoration: BoxDecoration(
//           color: const Color.fromARGB(255, 219, 240, 249),
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         child: const Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text('Hey!',
//                 style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
//             SizedBox(height: 10.0),
//             Text("You don't have any products to sell yet.",
//                 style: TextStyle(fontSize: 20.0)),
//             SizedBox(height: 10.0),
//             Text(
//                 "Let's add some products, it's easy to add, start tracking which products sold most or getting out of stock.",
//                 style: TextStyle(fontSize: 20.0)),
//             SizedBox(height: 10.0),
//             Text('Click below + Icon to add your first product.',
//                 style: TextStyle(fontSize: 20.0)),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'Products',
//             style: TextStyle(
//               fontSize: 25,
//               fontWeight: FontWeight.w500,
//               color: Colors.black,
//             ),
//           ),
//           centerTitle: true,
//           backgroundColor: Colors.lightBlueAccent,
//           leading: GestureDetector(
//             onTap: () {
//               Navigator.of(context).pushReplacement(MaterialPageRoute(
//                 builder: (context) => HomePage(),
//               ));
//             },
//             child: const Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//             ),
//           ),
//           actions: [
//             IconButton(
//               icon: const Icon(
//                 Icons.menu,
//                 color: Colors.black,
//               ), // This is the burger menu icon
//               onPressed: () {
//                 _showMenuContainer(context);
//               },
//             ),
//           ],
//         ),
//         body: buildEmptyMessage(context),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             _showProductForm(context);
//           },
//           backgroundColor: Colors.lightBlueAccent,
//           child: const Icon(
//             Icons.add,
//             size: 36,
//             color: Colors.white,
//           ),
//         ),
//       );
// }

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:kuza/pages/home_page.dart';

class Products extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController skuController = TextEditingController();
  final TextEditingController barcodeController = TextEditingController();
  final TextEditingController sellingPriceController = TextEditingController();

  Products({super.key});

  void _showProductForm(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.947,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        String barcodeScanRes =
                            await FlutterBarcodeScanner.scanBarcode(
                          "#ff6666", // scanner overlay color
                          "Cancel", // cancel button text
                          true, // show flash icon (Android)
                          ScanMode.BARCODE, // scan mode
                        );

                        if (barcodeScanRes != '-1') {
                          barcodeController.text = barcodeScanRes;
                        }
                      } catch (e) {
                        print("Error while scanning barcode: $e");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 167, 222, 248),
                    ),
                    child: const Text('Scan Barcode'),
                  ),
                  _customInputField(
                    nameController,
                    'Product Name',
                    'Enter Product Name',
                  ),
                  const SizedBox(height: 16.0),
                  _customInputField(
                    quantityController,
                    'Quantity in Stock',
                    'Enter Quantity',
                    TextInputType.number,
                  ),
                  const SizedBox(height: 16.0),
                  _customInputField(
                    skuController,
                    'SKU',
                    'Enter SKU',
                  ),
                  const SizedBox(height: 16.0),
                  _customInputField(
                    sellingPriceController,
                    'Selling Price',
                    'Enter Selling Price',
                    const TextInputType.numberWithOptions(decimal: true),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showMenuContainer(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.32,
            margin: const EdgeInsets.only(top: 50, left: 16.0, right: 16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Product List',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                ),
                const SizedBox(height: 30.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Action for exporting to PDF/Excel
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 167, 222, 248),
                      textStyle: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    icon: const Icon(Icons.insert_drive_file),
                    label: const Text(
                      'Export as PDF/Excel',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                const Divider(
                    height: 30.0,
                    thickness: 1.0,
                    indent: 20.0,
                    endIndent: 20.0), // This is the underline
                const Spacer(), // Pushes the next widget to the end
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // To close the dialog
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Text(
                      'Close',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, -1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }

  Widget _customInputField(
      TextEditingController controller, String header, String hintText,
      [TextInputType keyboardType = TextInputType.text]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        const SizedBox(height: 8.0),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              vertical: (header == 'Product Name') ? 35.0 : 20.0,
              horizontal: 10.0,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 167, 222, 248),
                width: 2.0,
              ),
            ),
            filled: true,
          ),
        ),
      ],
    );
  }

  Widget buildEmptyMessage(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height *
            0.4, // 40% of the screen height
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 219, 240, 249),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Hey!',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
            Text("You don't have any products to sell yet.",
                style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 10.0),
            Text(
                "Let's add some products, it's easy to add, start tracking which products sold most or getting out of stock.",
                style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 10.0),
            Text('Click below + Icon to add your first product.',
                style: TextStyle(fontSize: 20.0)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Products',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 167, 222, 248),
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
          actions: [
            IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ), // This is the burger menu icon
              onPressed: () {
                _showMenuContainer(context);
              },
            ),
          ],
        ),
        body: buildEmptyMessage(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showProductForm(context);
          },
          backgroundColor: Color.fromARGB(255, 167, 222, 248),
          child: const Icon(
            Icons.add,
            size: 36,
            color: Colors.white,
          ),
        ),
      );
}
