import 'package:flutter/material.dart';
import 'package:life_balance_plus/view/pages/diet_page.dart';
import 'package:life_balance_plus/view/pages/home_page.dart';
import 'package:life_balance_plus/view/pages/settings_page.dart';
import 'package:life_balance_plus/view/pages/workout_page.dart';

class AppBase extends StatefulWidget {
  const AppBase({super.key});

  @override
  State<AppBase> createState() => _AppBaseState();
}

class _AppBaseState extends State<AppBase> {
  int currentIndex = 0;
  final List<Widget> pages = <Widget>[
    HomePage(),
    WorkoutPage(),
    DietPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Life Balance Plus'),
        ),
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: currentIndex,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.fitness_center), label: 'Workout'),
            NavigationDestination(icon: Icon(Icons.restaurant), label: 'Diet'),
            NavigationDestination(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
          onDestinationSelected: (int value) =>
              setState(() => currentIndex = value),
        ),
        body: IndexedStack(
          index: currentIndex,
          children: pages,
        ));
  }
}
