// ignore_for_file: library_private_types_in_public_api, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cho_rider_app/Screens/rider_page.dart';
import '../services/riderService.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _riderService = RiderService();
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    print('Attempting to login with username: ${_nameController.text}');

    final rider = await _riderService.login(
      _nameController.text,
      _passwordController.text,
    );

    setState(() {
      _isLoading = false;
    });

    if (rider != null) {
      print('Login successful, Rider ID: ${rider.id}');
      await _riderService.saveRiderId(rider.id);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => RiderPage(rider: rider),
        ),
      );
    } else {
      print('Login failed');
      _showErrorDialog('Login failed. Please check your credentials.');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Row(
          children: [
            const Text("C"),
            Text("H", style: TextStyle(color: Colors.orange.shade600)),
            const Text("O"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const Icon(
                      Icons.delivery_dining,
                      color: Colors.grey,
                      size: 128,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Username',
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: const Color(0xFF373737),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        width: 1, color: Colors.black),
                                  ),
                                  child: TextFormField(
                                    controller: _nameController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(Icons.person),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Password',
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: const Color(0xFF373737),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        width: 1, color: Colors.black),
                                  ),
                                  child: TextFormField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(Icons.password),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 17, 0, 17),
                            child: Center(
                              child: ElevatedButton(
                                onPressed: _isLoading ? null : _login,
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  minimumSize: const Size(double.infinity, 60),
                                  elevation: 0,
                                  backgroundColor: const Color(0xFFFFD200),
                                ),
                                child: _isLoading
                                    ? const CircularProgressIndicator()
                                    : Text(
                                        'Sign In',
                                        style: GoogleFonts.getFont(
                                          'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                          color: const Color(0xFF373737),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
