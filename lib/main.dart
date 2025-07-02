import 'package:flutter/material.dart';
import 'register.dart';
import 'login.dart';
import 'home.dart';
import 'createaccount.dart'; 
import 'interestselection.dart'; 



void main() {
  runApp(SocialFeedApp());
}

class SocialFeedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X Feed Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/register', // ⬅️ tampilkan register saat awal
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/create-account': (context) => CreateAccountFormPage(),
        '/interestselection': (context) => InterestSelectionPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
