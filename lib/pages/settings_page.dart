import 'package:flutter/material.dart';
import 'package:kuza/pages/home_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Settings',
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
          padding: const EdgeInsets.only(top: 26.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Account Settings
                _buildSection(
                  context,
                  'Account Settings',
                  [
                    'Change Password',
                    'Manage Connected Accounts',
                    'Account Privacy',
                  ],
                  [
                    _handleSubsectionTap,
                    _handleSubsectionTap,
                    _handleSubsectionTap,
                  ],
                ),
                // Security Settings
                _buildSection(
                  context,
                  'Security Settings',
                  [
                    'Two-Factor Authentication (2FA)',
                    'Login Activity',
                    'Passcode/Pin Setup',
                  ],
                  [
                    _handleSubsectionTap,
                    _handleSubsectionTap,
                    _handleSubsectionTap,
                  ],
                ),
                // Notification Settings
                _buildSection(
                  context,
                  'Notification Settings',
                  [
                    'Push Notifications',
                    'Email Notifications',
                    'SMS Notifications',
                  ],
                  [
                    _handleSubsectionTap,
                    _handleSubsectionTap,
                    _handleSubsectionTap,
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  static void _handleSubsectionTap(BuildContext context) {
    // Handle Subsection Tap
  }

  static Widget _buildSection(
    BuildContext context,
    String title,
    List<String> subsectionTitles,
    List<void Function(BuildContext)> onTapCallbacks,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          children: List.generate(
            subsectionTitles.length,
            (index) => ListTile(
              title: Text(subsectionTitles[index]),
              onTap: () => onTapCallbacks[index](context),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
