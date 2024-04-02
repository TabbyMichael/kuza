import 'package:flutter/material.dart';

class StatisticsBarChart extends StatefulWidget {
  const StatisticsBarChart({super.key});

  @override
  _StatisticsBarChartState createState() => _StatisticsBarChartState();
}

class _StatisticsBarChartState extends State<StatisticsBarChart> {
  String _selectedFilterOption = 'Filter by';
  DateTimeRange? selectedDateRange;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Stats Overview',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 24 * 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Customer Information',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 20 * 1,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildHorizontalBar("Senior Citizen", 63, Colors.green),
                  const SizedBox(height: 8),
                  _buildHorizontalBar("Adults", 88, Colors.blue),
                  const SizedBox(height: 8),
                  _buildHorizontalBar("Children", 38, Colors.orange),
                  const SizedBox(height: 24),
                  const SizedBox(height: 16),
                  // Add more customer information or charts as needed
                ],
              ),
            ),
            // Filter Icon
            PopupMenuButton<String>(
              icon: const Icon(
                Icons.filter_list,
                color: Colors.black,
                size: 24,
              ),
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'Custom Date Range',
                    child: ListTile(
                      title: const Text('Date'),
                      trailing: ElevatedButton(
                        onPressed: () async {
                          final double screenHeight =
                              MediaQuery.of(context).size.height;
                          final double screenWidth =
                              MediaQuery.of(context).size.width;

                          final DateTimeRange? pickedDateRange =
                              await showDateRangePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                            builder: (BuildContext context, Widget? child) {
                              return Center(
                                child: Container(
                                  height: screenHeight * 0.8,
                                  width: screenWidth * 0.9,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Theme(
                                    data: ThemeData.light().copyWith(
                                      primaryColor: Colors.lightBlueAccent,
                                      buttonTheme: const ButtonThemeData(
                                        textTheme: ButtonTextTheme.primary,
                                      ),
                                    ),
                                    child: child!,
                                  ),
                                ),
                              );
                            },
                          );

                          if (pickedDateRange != null) {
                            setState(() {
                              selectedDateRange = pickedDateRange;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: Text(
                          selectedDateRange != null
                              ? 'Change Date'
                              : 'Select Date Range',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Filter by sales',
                    child: Text('Filter by sales'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Filter by Product',
                    child: Text('Filter by Product'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Filter by Price',
                    child: Text('Filter by Price'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Filter by Quantity',
                    child: Text('Filter by Quantity'),
                  ),
                ];
              },
              onSelected: (String value) {
                _handleFilterSelection(value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalBar(String label, double percentage, Color color) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 18 * 1,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: percentage * 2,
                height: 24,
                color: color,
              ),
              const SizedBox(width: 8),
              Text(
                '$percentage%',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16 * 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleFilterSelection(String value) {
    setState(() {
      _selectedFilterOption = value;
      // Implement your logic for filter change here
    });
  }
}
