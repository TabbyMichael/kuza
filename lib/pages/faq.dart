import 'package:flutter/material.dart';
import 'package:kuza/pages/home_page.dart';

class FAQ extends StatelessWidget {
  const FAQ({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqList = [
      // POS Questions
      {
        "question": "How to process a sale using POS?",
        "answer":
            "To process a sale using POS, select the items being purchased, add them to the cart, and proceed to payment. You can accept various forms of payment including cash, credit card, and mobile payments."
      },
      {
        "question": "How to apply discounts on POS?",
        "answer":
            "To apply discounts, select the item in the cart, choose the discount option, and enter the discount percentage or amount. The total will be updated automatically."
      },
      // Inventory Questions
      {
        "question": "How to add a new product to the inventory?",
        "answer":
            "To add a new product, go to the inventory section, click on '+', fill in the product details including name, category, price, and stock quantity, and save."
      },
      {
        "question": "How to track low stock items?",
        "answer":
            "To track low stock items, set up low stock alerts in the inventory settings. You will receive notifications when stock levels fall below the set threshold."
      },
      // Reports Questions
      {
        "question": "How to generate sales reports?",
        "answer":
            "To generate sales reports, go to the reports section, select 'Sales Reports', choose the date range, and generate the report. You can view, download, or print the report."
      },
      {
        "question": "What types of reports can be generated?",
        "answer":
            "You can generate various reports including sales reports, inventory reports, expense reports, and customer activity reports."
      },
      // Expenses Questions
      {
        "question": "How to record business expenses?",
        "answer":
            "To record expenses, go to the expenses section, click on 'Add Expense', fill in the details including amount, category, and date, and save."
      },
      {
        "question": "How to categorize expenses?",
        "answer":
            "You can categorize expenses by creating categories in the settings and assigning each expense to the appropriate category when adding it."
      },
      // Customers Questions
      {
        "question": "How to add a new customer?",
        "answer":
            "To add a new customer, go to the customers section, click on 'Add Customer', fill in the customer details including name, contact information, and any notes, and save."
      },
      {
        "question": "How to view customer purchase history?",
        "answer":
            "To view purchase history, go to the customers section, select the customer, and view their purchase history and details in their profile."
      },
      // Suppliers Questions
      {
        "question": "How to add a new supplier?",
        "answer":
            "To add a new supplier, go to the suppliers section, click on '+', fill in the supplier details including name, contact information, and any notes, and save."
      },
      {
        "question": "How to manage supplier orders?",
        "answer":
            "To manage supplier orders, go to the suppliers section, select the supplier, and view or create new orders in their profile."
      },
      // General Questions
      {
        "question": "How to reset my password?",
        "answer":
            "To reset your password, go to the login page and click on 'Forgot Password'. Follow the instructions to reset your password."
      },
      {
        "question": "How to contact support?",
        "answer":
            "You can contact support by emailing us at support@example.com or by calling our support number at +123456789."
      },
      {
        "question": "How to update my profile?",
        "answer":
            "To update your profile, go to the profile page and click on 'Edit Profile'. Make the necessary changes and save them."
      },
      {
        "question": "How to delete my account?",
        "answer":
            "To delete your account, please contact support at support@example.com. Our team will assist you with the account deletion process."
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FAQ',
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
              builder: (context) => HomePage(), // Navigate to the HomePage
            ));
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ), // Use the back arrow icon
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: faqList.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(
                faqList[index]["question"]!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    faqList[index]["answer"]!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
