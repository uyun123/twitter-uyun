import 'package:flutter/material.dart';

class CreateAccountFormPage extends StatefulWidget {
  @override
  _CreateAccountFormPageState createState() => _CreateAccountFormPageState();
}

class _CreateAccountFormPageState extends State<CreateAccountFormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              Center(
                child: Image.asset('assets/logotwitter.jpg', height: 30),
              ),
              SizedBox(height: 24),
              Text(
                'Create your account',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),

              TextField(
                controller: nameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 16),

              TextField(
                controller: phoneController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Phone',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text('Use email instead', style: TextStyle(color: Colors.blue)),
                ),
              ),
              SizedBox(height: 16),

              Text('Date of birth', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text(
                "This will not be shown publicly...",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(height: 12),

              Row(
                children: [
                  Expanded(child: _dropdown('Month', months)),
                  SizedBox(width: 8),
                  Expanded(child: _dropdown('Day', List.generate(31, (i) => (i + 1).toString()))),
                  SizedBox(width: 8),
                  Expanded(child: _dropdown('Year', List.generate(100, (i) => (2025 - i).toString()))),
                ],
              ),
              Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/interestselection'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: StadiumBorder(),
                  ),
                  child: Text('Next', style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _dropdown(String hint, List<String> items) {
    return DropdownButtonFormField<String>(
      dropdownColor: Colors.black,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
      ),
      style: TextStyle(color: Colors.white),
      onChanged: (value) {},
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ))
          .toList(),
    );
  }
}
