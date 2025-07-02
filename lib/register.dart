import 'dart:ui';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(color: Colors.black),

          // Blur layer
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),

          // Layout Builder for Responsive Layout
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
                              // LEFT: Logo occupies 50%
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 400,
                                  child: Image.asset(
                                    'assets/logotwitter.jpg',
                                    height: 200,
                                  ),
                                ),
                              ),
                              SizedBox(width: 32),

                              // RIGHT: Registration form
                              Expanded(flex: 1, child: _formContent(context)),
                            ],
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/logotwitter.jpg',
                                height: 200, 
                              ),
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
        Text(
          'Happening now',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Text(
          'Join today.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 32),

        // Social buttons
        _socialButton(
          icon: Icons.g_mobiledata,
          label: 'Sign up with Google',
          onPressed: () {},
        ),
        SizedBox(height: 12),
        _socialButton(
          icon: Icons.apple,
          label: 'Sign up with Apple',
          onPressed: () {},
        ),
        SizedBox(height: 20),

        Text("OR", style: TextStyle(color: Colors.grey)),
        SizedBox(height: 20),

        // Create Account Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/create-account'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              'Create Account',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        SizedBox(height: 20),

        // Terms
        Text(
          'By signing up, you agree to the Terms of Service and Privacy Policy, including Cookie Use.',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30),

        // Already have account
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account? ",
              style: TextStyle(color: Colors.white),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Log in"),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _socialButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.black),
        label: Text(
          label,
          style: TextStyle(color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
