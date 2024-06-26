import 'dart:async';
import 'package:kuza/models/other_incomes.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:kuza/models/customers.dart';
import 'package:kuza/models/products.dart';
import 'package:kuza/models/suppliers.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper; // Singleton DatabaseHelper
  static Database? _database; // Singleton Database

  // Define your database table and column names

  final String columnId = 'id';

  // Table name for Customers
  final String customerTableName = 'customers';
  final String columnName = 'name';
  final String columnContactNo = 'contactNo';
  final String columnEmailAddress = 'emailAddress';
  final String columnDate = 'date';

  // Table name for Products
  final String productTableName = 'products';
  final String columnProductName = 'productName';
  final String columnQuantity = 'quantity';
  final String columnSku = 'sku';
  final String columnBarcode = 'barcode';
  final String columnSellingPrice = 'sellingPrice';
  final String columnImage = 'image'; // Add this line for the image

  // Table name for Suppliers
  final String supplierTableName = 'suppliers';
  final String columnSupplierName = 'supplierName';
  final String columnContactPerson = 'contactPerson';
  final String columnContactNoSupplier = 'contactNo';
  final String columnEmailAddressSupplier = 'emailAddress';

  // Table name for Other Incomes
  final String otherIncomeTableName = 'other_incomes';
  final String columnDescription = 'description';
  final String columnAmount = 'amount';
  final String columnDateIncome = 'date';

  // Singleton constructor
  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper._createInstance();
    return _databaseHelper!;
  }

  DatabaseHelper._createInstance();

  // Get a reference to the database and create it if necessary
  Future<Database?> get database async {
    _database ??= await initializeDatabase();
    return _database;
  }

  // Initialize the database
  Future<Database> initializeDatabase() async {
    try {
      final String path = join(await getDatabasesPath(), 'kuza.db');
      final Database database = await openDatabase(
        path,
        version: 6, // Increment the version
        onCreate: _createDb,
        onUpgrade: _upgradeDb,
      );
      return database;
    } catch (e) {
      print('Error initializing database: $e');
      rethrow; // Rethrow the exception to propagate it further
    }
  }

  // Create the database tables for customers, products, and suppliers
  void _createDb(Database db, int newVersion) async {
    // Create the customers table
    await db.execute('''
    CREATE TABLE $customerTableName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnName TEXT,
      $columnContactNo TEXT,
      $columnEmailAddress TEXT,
      $columnDate TEXT
      )
    ''');

    // Create the products table
    await db.execute('''
    CREATE TABLE $productTableName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnProductName TEXT,
      $columnQuantity INTEGER,
      $columnSku TEXT,
      $columnBarcode TEXT,
      $columnSellingPrice REAL,
      $columnImage TEXT
      )
    ''');

    // Create the suppliers table
    await db.execute('''
    CREATE TABLE $supplierTableName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnSupplierName TEXT,
      $columnContactPerson TEXT,
      $columnContactNoSupplier TEXT,
      $columnEmailAddressSupplier TEXT
      )
    ''');

    // Create the other incomes table
    await db.execute('''
    CREATE TABLE $otherIncomeTableName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnDescription TEXT,
      $columnAmount REAL,
      $columnDateIncome TEXT
      )
    ''');
  }

  // Implement schema migration logic if necessary
  void _upgradeDb(Database db, int oldVersion, int newVersion) {
    // Implement schema migration logic here
  }

  // Insert a customer into the customers table
  Future<int> insertCustomer(Customer customer) async {
    final Database? db = await database;
    final int result = await db!.insert(
      customerTableName,
      customer.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return result;
  }

  // Query all customers from the customers table
  Future<List<Customer>> getCustomers() async {
    final Database? db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(customerTableName);
    return List.generate(maps.length, (i) {
      return Customer.fromMap(maps[i]);
    });
  }

  // Update a customer in the customers table
  Future<int> updateCustomer(Customer customer) async {
    final Database? db = await database;
    final int result = await db!.update(
      customerTableName,
      customer.toMap(),
      where: '$columnId = ?',
      whereArgs: [customer.id],
    );
    return result;
  }

  // Delete a customer from the customers table
  Future<int> deleteCustomer(int id) async {
    final Database? db = await database;
    final int result = await db!.delete(
      customerTableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
    return result;
  }

  // Insert a product into the products table
  Future<int> insertProduct(Product product) async {
    final Database? db = await database;
    final int result = await db!.insert(
      productTableName,
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return result;
  }

  // Query all products from the products table
  Future<List<Product>> getProducts() async {
    final Database? db = await database;
    try {
      final List<Map<String, dynamic>> maps = await db!.query(productTableName);
      return List.generate(maps.length, (i) {
        return Product.fromMap(maps[i]);
      });
    } catch (e) {
      print('Error getting products: $e');
      return [];
    }
  }

  // Update a product in the products table
  Future<int> updateProduct(Product product) async {
    final Database? db = await database;
    final int result = await db!.update(
      productTableName,
      product.toMap(),
      where: '$columnId = ?',
      whereArgs: [product.id],
    );
    return result;
  }

  // Delete a product from the products table
  Future<int> deleteProduct(int id) async {
    final Database? db = await database;
    final int result = await db!.delete(
      productTableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
    return result;
  }

  // Insert a supplier into the suppliers table
  Future<int> insertSupplier(Supplier supplier) async {
    final Database? db = await database;
    final int result = await db!.insert(
      supplierTableName,
      supplier.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return result;
  }

  // Query all suppliers from the suppliers table
  Future<List<Supplier>> getSuppliers() async {
    final Database? db = await database;
    try {
      final List<Map<String, dynamic>> maps =
          await db!.query(supplierTableName);
      return List.generate(maps.length, (i) {
        return Supplier.fromMap(maps[i]);
      });
    } catch (e) {
      print('Error getting suppliers: $e');
      return [];
    }
  }

  // Update a supplier in the suppliers table
  Future<int> updateSupplier(Supplier supplier) async {
    final Database? db = await database;
    final int result = await db!.update(
      supplierTableName,
      supplier.toMap(),
      where: '$columnId = ?',
      whereArgs: [supplier.id],
    );
    return result;
  }

  // Delete a supplier from the suppliers table
  Future<int> deleteSupplier(int id) async {
    final Database? db = await database;
    final int result = await db!.delete(
      supplierTableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
    return result;
  }

  // Insert an other income into the other incomes table
  Future<int> insertOtherIncome(OtherIncome income) async {
    final Database? db = await database;
    final int result = await db!.insert(
      otherIncomeTableName,
      income.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return result;
  }

  // Query all other incomes from the other incomes table
  Future<List<OtherIncome>> getOtherIncomes() async {
    final Database? db = await database;
    final List<Map<String, dynamic>> maps =
        await db!.query(otherIncomeTableName);
    return List.generate(maps.length, (i) {
      return OtherIncome.fromMap(maps[i]);
    });
  }

  // Update an other income in the other incomes table
  Future<int> updateOtherIncome(OtherIncome income) async {
    final Database? db = await database;
    final int result = await db!.update(
      otherIncomeTableName,
      income.toMap(),
      where: '$columnId = ?',
      whereArgs: [income.id],
    );
    return result;
  }

  // Delete an other income from the other incomes table
  Future<int> deleteOtherIncome(int id) async {
    final Database? db = await database;
    final int result = await db!.delete(
      otherIncomeTableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
    return result;
  }

  // Close the database
  Future<void> close() async {
    final Database? db = await database;
    db?.close();
  }
}
