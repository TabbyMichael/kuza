import 'package:flutter/material.dart';
import 'package:kuza/business/Dashboard/bar_chart.dart';
import 'package:kuza/business/Dashboard/custom_data_overview.dart';
import 'package:kuza/business/Dashboard/pie_chart.dart';
import 'package:kuza/business/Dashboard/static_chart.dart';
import 'package:kuza/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Container 1
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              color: Colors.white,
              child: const PieChartSample2(),
            ),

            const SizedBox(height: 20),

            // Container 2
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              color: Colors.white,
              child: const BarChartSample2(),
            ),

            const SizedBox(height: 20),

            // Container 3
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              color: Colors.white,
              child: const DataOverviewWidget(),
            ),
            const SizedBox(height: 20),

            // Container 4
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              color: Colors.white,
              child: const StatisticsBarChart(),
            ),
          ],
        ),
      ),
    );
  }
}
