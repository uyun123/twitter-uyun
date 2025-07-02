import 'package:flutter/material.dart';

class InterestSelectionPage extends StatelessWidget {
  InterestSelectionPage() {
    print("InterestSelectionPage Loaded");
  }

  final List<String> gamingInterests = [
    "PlayerUnknown's Battlegrounds",
    "Esports",
    "Video games",
    "Arcade gaming",
    "Mobile gaming",
    "PC gaming"
  ];

  final List<String> techInterests = [
    "Computer programming",
    "Android",
    "Apple",
    "Cybersecurity"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(height: 16),
              Text(
                "What do you want to see on X?",
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Interests are used to personalize your experience and will be visible on your profile.",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 24),
              _buildSection("Gaming", gamingInterests),
              SizedBox(height: 16),
              _buildSection("Technology", techInterests),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print("Navigating to Home");
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: StadiumBorder(),
                  ),
                  child: Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> interests) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: interests
              .map((interest) => ChoiceChip(
                    label: Text(interest),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: Colors.grey[800],
                    selectedColor: Colors.blue,
                    selected: false,
                    onSelected: (selected) {
                      // simpan pilihan jika perlu
                    },
                  ))
              .toList(),
        ),
      ],
    );
  }
}
