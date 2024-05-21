import 'package:flutter/material.dart';
import 'package:kuza/pages/Settings/Pin_setup_page.dart';
import 'package:kuza/pages/Settings/SMS_notifications_page.dart';
import 'package:kuza/pages/Settings/account_privacy_page.dart';
import 'package:kuza/pages/Settings/change_password_page.dart';
import 'package:kuza/pages/Settings/email_notifications_page.dart';
import 'package:kuza/pages/Settings/login_activity_page.dart';
import 'package:kuza/pages/Settings/manage_connected_accounts_page.dart';
import 'package:kuza/pages/Settings/push_notifications_page.dart';
import 'package:kuza/pages/Settings/two-factor_authentication_page.dart';
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
                    () => _navigateToPage(context, const ChangePasswordPage()),
                    () => _navigateToPage(
                        context, const ManageConnectedAccountsPage()),
                    () => _navigateToPage(context, const AccountPrivacyPage()),
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
                    () => _navigateToPage(context, const TwoFactorAuthPage()),
                    () => _navigateToPage(context, const LoginActivityPage()),
                    () =>
                        _navigateToPage(context, const PasscodePinSetupPage()),
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
                    () =>
                        _navigateToPage(context, const PushNotificationsPage()),
                    () => _navigateToPage(
                        context, const EmailNotificationsPage()),
                    () =>
                        _navigateToPage(context, const SmsNotificationsPage()),
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

  static void _navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static Widget _buildSection(
    BuildContext context,
    String title,
    List<String> subsectionTitles,
    List<void Function()> onTapCallbacks,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            title,
            style: const TextStyle(
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
              onTap: onTapCallbacks[index],
            ),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
