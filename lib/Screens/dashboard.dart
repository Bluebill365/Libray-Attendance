import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:library_attendance/Screens/qrscannerscreen.dart';
import 'package:library_attendance/features/qr_checkin/bloc/data/qr_repository.dart';
import 'package:library_attendance/features/qr_checkin/bloc/qr_bloc.dart';
import 'settings.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Library Attendance")),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // Home Screen
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.qr_code_scanner_rounded, size: 60),
                const SizedBox(height: 16),
                const Text(
                  "Welcome to Library Attendance",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          // Settings Screen
          const Settings(),
        ],
      ),
      bottomNavigationBar: Container(
        child: SafeArea(
          child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: _onItemTapped,
            haptic: true,
            gap: 10,
            iconSize: 25,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            tabs: [
              GButton(icon: Icons.home, text: "Home"),
              GButton(icon: Icons.settings, text: "Settings"),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (_) => QRBloc(),
                child: const QRScannerScreen(),
              ),
            ),
          );
        },
        child: const Icon(Icons.camera, size: 25),
      ),
    );
  }
}
