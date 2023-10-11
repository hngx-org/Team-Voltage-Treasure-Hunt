import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:voltage_treasure_hunt/presentation/app_settings/settings_screen.dart';
import 'package:voltage_treasure_hunt/presentation/home_screen/home_screen_implementation.dart';
import 'package:voltage_treasure_hunt/presentation/interactive_maps/map_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    const Dashboard(),
   const MapPage(),
    const SettingsScreen()
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (int _index) {
            setState(() {
              _currentIndex = _index;
            });
          },
          items: [
            SalomonBottomBarItem(
              selectedColor: Colors.red,
              unselectedColor: Colors.grey,
              icon: const Icon(Icons.home),
              title: const Text("Home"),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.green,
              unselectedColor: Colors.grey,
              icon: const Icon(Icons.event),
              title: const Text("Events"),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.blue,
              unselectedColor: Colors.grey,
              icon: const Icon(Icons.settings),
              title: const Text("Settings"),
            )
          ]),
    );
  }
}
