import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kuza/pages/brand_intro.dart';
import 'package:kuza/pages/home_page.dart';

class UserPage extends StatefulWidget {
  final String name;
  final String urlImage;

  const UserPage({
    Key? key,
    required this.name,
    required this.urlImage,
  }) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  XFile? _pickedImage;

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _pickedImage = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 167, 222, 248),
                    Color.fromARGB(255, 167, 222, 248),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 8,
              left: 16.0,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
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
                            GestureDetector(
                              onTap: _pickImage,
                              child: CircleAvatar(
                                backgroundImage: _pickedImage != null
                                    ? FileImage(File(_pickedImage!.path))
                                    : AssetImage(
                                        'assets/markus-winkler-pOu_UmkOG-0-unsplash.jpg',
                                      ) as ImageProvider,
                                radius: MediaQuery.of(context).size.height / 10,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 15,
                            ),
                            Text(
                              widget.name,
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
                                      top: MediaQuery.of(context).size.height /
                                          90),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 167, 222, 248),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            MediaQuery.of(context).size.height /
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
                                    child: Center(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  BrandIntroPage(),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255,
                                              167,
                                              222,
                                              248), // Set the background color
                                        ),
                                        child: const Text(
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
                color: const Color.fromARGB(255, 167, 222, 248),
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
