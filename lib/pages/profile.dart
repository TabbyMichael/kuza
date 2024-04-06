import 'package:flutter/material.dart';
import 'package:kuza/pages/home_page.dart';

class UserPage extends StatelessWidget {
  final String name;
  final String urlImage;

  const UserPage({
    super.key,
    required this.name,
    required this.urlImage,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomePage(), // Navigate to the HomePage
          ));
        },
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF4FC3F7),
                      Color(0xFF4FC3F7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 8,
                  left: 16.0, // Adjust the left padding to match your design
                  right: 16.0, // Adjust the right padding to match your design
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: Container(
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: const AssetImage(
                                    'lib/assets/joshua-hanson-I49bIyEHaIs-unsplash.jpg'),
                                radius: MediaQuery.of(context).size.height / 10,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 15,
                              ),
                              Text(
                                name,
                                style: const TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 1.8),
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 2.0,
                          left: MediaQuery.of(context).size.width / 20,
                          right: MediaQuery.of(context).size.width / 20,
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 2.0,
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.width / 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    headerChild('Products', 114),
                                    headerChild('Sales', 1205),
                                    headerChild('Expenses', 360),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 20),
                              child: Column(
                                children: <Widget>[
                                  infoChild(MediaQuery.of(context).size.width,
                                      Icons.person, 'Mama Oliech'),
                                  infoChild(MediaQuery.of(context).size.width,
                                      Icons.email, 'mamaoliech254@gmail.com'),
                                  infoChild(MediaQuery.of(context).size.width,
                                      Icons.place_rounded, 'Nairobi, Kenya'),
                                  infoChild(MediaQuery.of(context).size.width,
                                      Icons.local_mall, 'CBD, Nairobi'),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height /
                                                90),
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF4FC3F7),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20),
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black87,
                                            blurRadius: 2.0,
                                            offset: Offset(0.0, 1.0),
                                          ),
                                        ],
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Log Out',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget headerChild(String header, int value) => Expanded(
        child: Column(
          children: <Widget>[
            Text(header),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              '$value',
              style: const TextStyle(
                fontSize: 14.0,
                color: Color(0xFF4FC3F7),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );

  Widget infoChild(double width, IconData icon, data) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: InkWell(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: width / 10,
              ),
              Icon(
                icon,
                color: const Color(0xFF4FC3F7),
                size: 36.0,
              ),
              SizedBox(
                width: width / 20,
              ),
              Text(data),
            ],
          ),
          onTap: () {
            print('Info Object selected');
          },
        ),
      );
}
