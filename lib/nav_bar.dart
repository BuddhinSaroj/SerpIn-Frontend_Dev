import 'package:flutter/material.dart';

import 'body_forum.dart';
import 'help_page.dart';
import 'home_page.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int currentIndex =
      1; // Add currentIndex variable to keep track of selected index
  final screens = [ForumData(), HomePage(), HelpScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFAFEFF), Color(0xFFABFFDC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined),
              label: "Community",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help_outline_rounded),
              label: 'Settings',
            ),
          ],
          elevation: 0,
          currentIndex: currentIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
          ),
          backgroundColor: Colors.transparent,
          onTap: (index) => setState(() =>
              currentIndex = index), // Add setState to update currentIndex
        ),
      ),
    );
  }
}

// Define ForumData(), HomePage(), and HelpScreen() as separate widget classes
