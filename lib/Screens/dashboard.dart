import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: SafeArea(
          child: GNav(
            haptic: true,
            gap: 5,
            iconSize: 20,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            tabs: [
              GButton(icon: Icons.home, text: "Home"),
              GButton(icon: Icons.settings, text: "Settings"),
            ],
          ),
        ),
      ),
    );
  }
}
