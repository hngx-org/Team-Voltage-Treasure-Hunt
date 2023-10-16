import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:voltage_treasure_hunt/presentation/app_settings/settings_screen.dart';
import 'package:voltage_treasure_hunt/presentation/home_screen/home_screen_implementation.dart';
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
      const MapPage(),
      const SettingsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              offset: Offset(0, 0),
              blurRadius: 10,
            ),
          ],
        ),
        child: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
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
      ),
    );
  }
}
