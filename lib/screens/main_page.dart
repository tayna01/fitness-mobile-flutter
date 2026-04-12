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
  int selectedIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    WorkoutsScreen(),
    ProgressScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: screens),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
      ),
    );
  }
}
