import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _obscureText = true; // Member variable to store password visibility

  void _changePassword() async {
    String currentPassword = _currentPasswordController.text;
    String newPassword = _newPasswordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    User? user = _auth.currentUser;
    if (user != null) {
      String email = user.email!;

      try {
        AuthCredential credential = EmailAuthProvider.credential(
          email: email,
          password: currentPassword,
        );

        await user.reauthenticateWithCredential(credential);
        await user.updatePassword(newPassword);
        await _auth.signOut();
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: newPassword,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password changed successfully')),
        );
        _sendPasswordChangedEmail(email);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }

  void _sendPasswordChangedEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print('Error sending password change email: $e');
    }
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextField(
            controller: controller,
            obscureText: _obscureText, // Use member variable here
            decoration: InputDecoration(
              labelText: label,
              border: const OutlineInputBorder(),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText; // Toggle password visibility
              });
            },
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPasswordField(
              controller: _currentPasswordController,
              label: 'Current Password',
            ),
            _buildPasswordField(
              controller: _newPasswordController,
              label: 'New Password',
            ),
            _buildPasswordField(
              controller: _confirmPasswordController,
              label: 'Confirm New Password',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changePassword,
              child: const Text('Change Password'),
            ),
          ],
        ),
      ),
    );
  }
}
