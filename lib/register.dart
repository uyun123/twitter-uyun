import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;

  Future<void> registerUser() async {
    setState(() => isLoading = true);

final url = Uri.parse("http://10.100.4.227/flutter_api/api/register.php");

    final response = await http.post(url, body: {
      "name": _nameController.text,
      "email": _emailController.text,
      "password": _passwordController.text,
    });

    final data = json.decode(response.body);
    setState(() => isLoading = false);

    if (data['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Register berhasil!")));
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data['message'])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.black),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              bool isWide = constraints.maxWidth >= 800;
              return Center(
                child: SafeArea(
                  child: Container(
                    margin: EdgeInsets.all(24),
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    constraints: BoxConstraints(maxWidth: 1000),
                    child: isWide
                        ? Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 400,
                                  child: Image.asset('assets/logotwitter.jpg', height: 200),
                                ),
                              ),
                              SizedBox(width: 32),
                              Expanded(flex: 1, child: _formContent(context)),
                            ],
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset('assets/logotwitter.jpg', height: 200),
                              SizedBox(height: 24),
                              _formContent(context),
                            ],
                          ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _formContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Join now', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
        SizedBox(height: 24),

        TextField(
          controller: _nameController,
          style: TextStyle(color: Colors.white),
          decoration: _inputDecoration("Full Name"),
        ),
        SizedBox(height: 16),

        TextField(
          controller: _emailController,
          style: TextStyle(color: Colors.white),
          decoration: _inputDecoration("Email"),
        ),
        SizedBox(height: 16),

        TextField(
          controller: _passwordController,
          obscureText: true,
          style: TextStyle(color: Colors.white),
          decoration: _inputDecoration("Password"),
        ),
        SizedBox(height: 24),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isLoading ? null : registerUser,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
            child: isLoading
                ? CircularProgressIndicator(color: Colors.white)
                : Text('Create Account'),
          ),
        ),
        SizedBox(height: 20),

        Text(
          'By signing up, you agree to the Terms of Service and Privacy Policy.',
          style: TextStyle(color: Colors.grey, fontSize: 12),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account? ", style: TextStyle(color: Colors.white)),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Log in"),
              style: TextButton.styleFrom(foregroundColor: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey),
      filled: true,
      fillColor: Colors.grey[900],
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
