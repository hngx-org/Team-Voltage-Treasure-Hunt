// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

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
  final List<Widget> _pages = [ Dashboard(), const MapPage(), const SettingsScreen()];

  int _currentIndex = 0;

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
              icon: const Icon(Icons.map_rounded),
              title: const Text("Events"),
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
