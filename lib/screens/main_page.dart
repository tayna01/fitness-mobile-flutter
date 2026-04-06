import 'package:fitness_mobile_flutter/screens/progress_screen.dart';
import 'package:fitness_mobile_flutter/screens/workouts_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitness_mobile_flutter/widgets/bottom_navigation_widget.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    WorkoutsScreen(),
    ProgressScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
