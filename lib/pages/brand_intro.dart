import 'dart:async';

import 'package:flutter/material.dart';

class BrandIntroPage extends StatefulWidget {
  const BrandIntroPage({super.key});

  @override
  _BrandIntroPageState createState() => _BrandIntroPageState();
}

class _BrandIntroPageState extends State<BrandIntroPage> {
  List<Map<String, dynamic>> slides = [
    {
      'title': 'Elevate Your Shop',
      'description':
          'Effortlessly manage your shop with our all-in-one solution',
      'image': 'lib/assets/florence-1-scaled.jpg',
    },
    {
      'title': 'Swift Deliveries',
      'description':
          'Receive and send orders with lightning-fast delivery services',
      'image': 'lib/assets/tanzania-shopkeeper-947x711-366212448.jpg',
    },
    {
      'title': 'Diverse Selection',
      'description':
          'Offer a diverse range of products to cater to your customers',
      'image': 'lib/assets/Tz markets.jpeg',
    },
    {
      'title': 'Inventory Mastery',
      'description':
          'Efficiently track and manage your inventory to never run out of stock',
      'image': 'lib/assets/Kuza.png',
    },
    {
      'title': 'Sales Insights',
      'description':
          'Gain valuable insights into your sales data for smarter business decisions',
      'image':
          'lib/assets/Kenya_Mom-and-Pop-Shops_by-Paul-Njuguna-TNS-August-2016-1-500930076.jpg',
    }
  ];

  late Timer timer;
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      if (currentIndex < slides.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }

      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  void stopTimer() {
    if (timer.isActive) {
      timer.cancel();
    }
  }

  @override
  void dispose() {
    stopTimer();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kuza',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 167, 222, 248),
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.55,
            child: PageView.builder(
              controller: pageController,
              itemCount: slides.length,
              onPageChanged: (val) {
                setState(() {
                  currentIndex = val;
                });
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onPanUpdate: (details) {
                    stopTimer();
                  },
                  onPanEnd: (details) {
                    startTimer();
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        slides[index]['image'],
                        fit: BoxFit.cover,
                        height: screenHeight * 0.41,
                      ),
                      const SizedBox(height: 40),
                      Text(
                        slides[index]['title'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(44, 44, 44, 1),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        slides[index]['description'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(44, 44, 44, 1),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(slides.length, (index) {
              return Container(
                margin: const EdgeInsets.all(4.0),
                width: currentIndex == index ? 12.0 : 8.0,
                height: currentIndex == index ? 12.0 : 8.0,
                decoration: BoxDecoration(
                  color: currentIndex == index
                      ? const Color.fromARGB(255, 167, 222, 248)
                      : Colors.grey,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/signUp');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 167, 222, 248),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
            ),
            child: const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 167, 222, 248),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
            ),
            child: const Text(
              'Already Have an Account',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
