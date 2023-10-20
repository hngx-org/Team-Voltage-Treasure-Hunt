// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:voltage_treasure_hunt/presentation/app_settings/settings_screen.dart';
import 'package:voltage_treasure_hunt/presentation/home_screen/Dashboard.dart';
import 'package:voltage_treasure_hunt/presentation/interactive_maps/map_screen.dart';

class HomePage extends StatefulWidget {
  final String name;
  final String email;
  const HomePage({super.key, required this.name, required this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final List<Widget> _pages;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      Dashboard(
        name: widget.name,
        email: widget.email,
      ),
      // const MapPage(),
      MapScreen(),
      SettingsScreen()
    ];

    int _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
          backgroundColor: Color(0xff001532),
          currentIndex: _currentIndex,
          onTap: (int _index) {
            setState(() {
              _currentIndex = _index;
            });
          },
          items: [
            SalomonBottomBarItem(
              selectedColor: Color(0xff5FCFA3),
              unselectedColor: Colors.grey,
              icon: const Icon(Icons.home),
              title: const Text("Home"),
            ),
            SalomonBottomBarItem(
              selectedColor: Color(0xff5FCFA3),
              unselectedColor: Colors.grey,
              icon: const Icon(Icons.location_city_rounded),
              title: const Text("Arenas"),
            ),
            SalomonBottomBarItem(
              selectedColor: Color(0xff5FCFA3),
              unselectedColor: Colors.grey,
              icon: const Icon(Icons.settings),
              title: const Text("Settings"),
            )
          ]),
    );
  }
}