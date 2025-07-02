import 'dart:ui';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background color
          Container(color: Colors.black),

          // Blur layer
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),

          // Centered black popup
          Center(
            child: SafeArea(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Close icon
                      Align(
                        alignment: Alignment.topLeft,
                        child: Icon(Icons.close, color: Colors.white),
                      ),
                      SizedBox(height: 10),

                      // X Logo (placeholder icon)
                      Icon(Icons.close_fullscreen, size: 40, color: Colors.white),
                      SizedBox(height: 16),

                      Text(
                        'Sign in to X',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 24),

                      // Social buttons
                      _socialButton(
                        icon: Icons.g_mobiledata,
                        label: 'Login with Google',
                        onPressed: () {},
                      ),
                      SizedBox(height: 12),
                      _socialButton(
                        icon: Icons.apple,
                        label: 'Login with Apple',
                        onPressed: () {},
                      ),
                      SizedBox(height: 20),

                      Text("or", style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 20),

                      // Input field
                      TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Phone, email, or username',
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.grey[900],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Next button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text('Next'),
                        ),
                      ),
                      SizedBox(height: 12),

                      // Forgot password
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.white),
                            padding: EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            foregroundColor: Colors.white,
                          ),
                          child: Text('Forgot password?'),
                        ),
                      ),
                      SizedBox(height: 16),

                      // Sign up prompt
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?", style: TextStyle(color: Colors.grey[400])),
                          TextButton(
                            onPressed: () => Navigator.pushNamed(context, '/register'),
                            child: Text('Sign up'),
                            style: TextButton.styleFrom(foregroundColor: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Social button builder
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
        label: Text(label, style: TextStyle(color: Colors.black)),
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
