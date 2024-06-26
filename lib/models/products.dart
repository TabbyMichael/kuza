class Product {
  final int? id;
  final String productName;
  final int quantity;
  final String sku;
  final String barcode;
  final double sellingPrice;
  final String? image; // Added this line

  Product({
    this.id,
    required this.productName,
    required this.quantity,
    required this.sku,
    required this.barcode,
    required this.sellingPrice,
    this.image, // Added this line
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productName': productName,
      'quantity': quantity,
      'sku': sku,
      'barcode': barcode,
      'sellingPrice': sellingPrice,
      'image': image, // Added this line
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      productName: map['productName'],
      quantity: map['quantity'],
      sku: map['sku'],
      barcode: map['barcode'],
      sellingPrice: map['sellingPrice'],
      image: map['image'], // Added this line
    );
  }
}
