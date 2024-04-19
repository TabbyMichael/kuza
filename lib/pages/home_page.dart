import 'package:flutter/material.dart';
import 'package:kuza/business/Customers/customers.dart';
import 'package:kuza/business/Suppliers/suppliers.dart';
import 'package:kuza/business/Other%20Incomes/other_incomes.dart';
import 'package:kuza/pages/notification.dart';
import 'package:kuza/pages/widgets/navigation_drawer.dart';
import 'package:kuza/business/Inventory/products.dart';
import 'package:kuza/business/Expenses/screens/category_screen.dart';
import 'package:kuza/business/Point%20of%20sale%20(POS)/sales.dart';
import 'package:kuza/business/stores.dart';
import 'package:kuza/business/Dashboard/reports.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> tileNames = [
    'Sales',
    'Products',
    'Expenses',
    'Customers',
    'Reports',
    'Supplier',
    'Stores',
    'Other Income',
  ];

  final List<IconData> tileIcons = [
    Icons.attach_money_outlined,
    Icons.inventory_2_outlined,
    Icons.money_off,
    Icons.people,
    Icons.analytics,
    Icons.person,
    Icons.store,
    Icons.monetization_on,
  ];

  void navigateToDetailScreen(BuildContext context, String name) {
    switch (name) {
      case 'Sales':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Sales()));
        break;
      case 'Products':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ProductsPage()));
        break;
      case 'Expenses':
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const CategoryScreen()));
        break;
      case 'Stores':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Stores()));
        break;
      case 'Supplier':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Supplier()));
        break;
      case 'Customers':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Customers()));
        break;
      case 'Reports':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Dashboard()));
        break;
      case 'Other Income':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => OtherIncomesPage()));
        break;
      default:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()));
        break;
    }
  }

  Widget buildClickableTile(BuildContext context, String name, IconData icon) {
    return GestureDetector(
      onTap: () {
        navigateToDetailScreen(context, name);
      },
      child: Card(
        elevation: 0.2,
        color: Color.fromARGB(255, 167, 222, 248),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 94,
              color: Colors.white,
            ),
            const SizedBox(height: 8),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mama Oliech',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 167, 222, 248),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const NotificationsPage(),
              ));
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.help_outline,
              color: Colors.black,
            ),
            onPressed: () {
              // Handle question mark icon click here
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: tileNames.length,
                  itemBuilder: (context, index) {
                    return buildClickableTile(
                        context, tileNames[index], tileIcons[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.9,
        child: const NavigationDrawerWidget(),
      ),
    );
  }
}
