import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:country_code_picker/country_code_picker.dart';

class TwoFactorAuthPage extends StatefulWidget {
  @override
  _TwoFactorAuthPageState createState() => _TwoFactorAuthPageState();
}

class _TwoFactorAuthPageState extends State<TwoFactorAuthPage> {
  final _phoneController = TextEditingController();
  String _countryCode = '+254'; // Default country code
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _enable2FA() async {
    String phoneNumber = '$_countryCode${_phoneController.text}';
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.currentUser?.updatePhoneNumber(credential);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('2FA enabled successfully')),
        );
        _redirectToSettings();
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Verification failed: ${e.message}')),
        );
      },
      codeSent: (String verificationId, int? resendToken) async {
        String smsCode = await _showSmsCodeDialog();
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);
        await _auth.currentUser?.updatePhoneNumber(credential);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('2FA enabled successfully')),
        );
        _redirectToSettings();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<String> _showSmsCodeDialog() async {
    String smsCode = '';
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Enter SMS Code'),
          content: TextField(
            onChanged: (value) {
              smsCode = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(smsCode);
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
    return smsCode;
  }

  void _redirectToSettings() {
    Navigator.pushReplacementNamed(context, '/settings');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Two-Factor Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildCountryCodeField(),
                ),
                const SizedBox(width: 8), // Adjust the width as needed
                Expanded(
                  flex: 3,
                  child: _buildPhoneNumberField(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _enable2FA,
              child: const Text('Enable 2FA'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountryCodeField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        readOnly: true,
        onTap: () async {
          // Show the country code picker when the field is tapped
          CountryCode? countryCode = await showCountryCodePicker();
          if (countryCode != null) {
            setState(() {
              _countryCode = countryCode.dialCode!;
            });
          }
        },
        decoration: const InputDecoration(
          labelText: 'Country Code',
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.arrow_drop_down),
        ),
        controller: TextEditingController(text: _countryCode),
      ),
    );
  }

  Future<CountryCode?> showCountryCodePicker() async {
    CountryCode? selectedCountryCode;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Country Code'),
          content: SizedBox(
            width: double.maxFinite,
            height: 400,
            child: CountryCodePicker(
              onChanged: (countryCode) {
                selectedCountryCode = countryCode;
              },
              initialSelection: 'KE',
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              favorite: ['+254', 'KE'],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(selectedCountryCode);
              },
              child: const Text('Select'),
            ),
          ],
        );
      },
    );
    return selectedCountryCode;
  }

  Widget _buildPhoneNumberField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
