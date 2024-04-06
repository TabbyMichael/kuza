import 'package:flutter/material.dart';
import 'package:kuza/business/Point%20of%20sale%20(POS)/cart/cart.dart';
import 'package:kuza/business/Point%20of%20sale%20(POS)/cart/grocery_tile.dart';
import 'package:kuza/business/Point%20of%20sale%20(POS)/cart_model.dart';
import 'package:kuza/pages/home_page.dart';
import 'package:provider/provider.dart';

class Sales extends StatelessWidget {
  const Sales({Key? key});

  @override
  Widget build(BuildContext context) {
    final cartModel =
        Provider.of<CartModel>(context); // Create an instance of CartModel

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sales',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) =>
                  const HomePage(), // Navigate to the HomePage
            ));
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ), // Use the back arrow icon
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const CartPage();
            },
          ),
        ),
        child: const Icon(
          Icons.shopping_bag,
          color: Colors.lightBlueAccent,
          size: 28,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          // good morning bro
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Good Morning,',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 4),
          // Let's order fresh items for you
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Let's place your Order",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(),
          ),
          const SizedBox(height: 24),
          // categories -> horizontal listview
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Fresh Items",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          // recent orders -> show last 3
          Expanded(
            child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: value.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () =>
                          cartModel.addItemToCart(index), // Add item to cart
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
