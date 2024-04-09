import 'package:flutter/material.dart';
import 'package:kuza/pages/home_page.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  final _formKey = GlobalKey<FormState>();
  bool showSendButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Us',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 167, 222, 248),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10.0),
              // Pharmacy ID Box
              Container(
                width: MediaQuery.of(context).size.width *
                    0.8, // 80% of screen width
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Name';
                    }
                    return null;
                  },
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Names',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8.0),
                  ),
                  onTap: () {
                    setState(() {
                      showSendButton = true;
                    });
                  },
                ),
              ),
              const SizedBox(height: 30.0), // Spacer

              // Email Box
              Container(
                width: MediaQuery.of(context).size.width *
                    0.8, // 80% of screen width
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Phone number';
                    }
                    return null;
                  },
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Phone number',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8.0),
                  ),
                  onTap: () {
                    setState(() {
                      showSendButton = true;
                    });
                  },
                ),
              ),
              const SizedBox(height: 30.0), // Spacer

              Container(
                width: MediaQuery.of(context).size.width *
                    0.8, // 80% of screen width
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Subject';
                    }
                    return null;
                  },
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Subject',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8.0),
                  ),
                  onTap: () {
                    setState(() {
                      showSendButton = true;
                    });
                  },
                ),
              ),
              const SizedBox(height: 30.0), // Spacer

              // Message Box
              Container(
                width: MediaQuery.of(context).size.width *
                    0.8, // 80% of screen width
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your message';
                    }
                    return null;
                  },
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 7, // Set the desired number of lines
                  decoration: const InputDecoration(
                    hintText: 'Type message here',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8.0),
                  ),
                  onTap: () {
                    setState(() {
                      showSendButton = true;
                    });
                  },
                ),
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 120.0, // Set the desired width
        height: 60.0, // Set the desired height
        child: FloatingActionButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              // Handle the submission logic here
              print('Form is valid. Submitting data...');
            }
          },
          backgroundColor: Color.fromARGB(255, 167, 222, 248),
          child: const Text(
            "Send",
            style: TextStyle(
              fontSize: 25, // Adjust the font size as needed
              fontWeight: FontWeight.bold, // Adjust the font weight as needed
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
