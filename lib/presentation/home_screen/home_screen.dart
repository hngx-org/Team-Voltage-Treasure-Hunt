import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:voltage_treasure_hunt/presentation/app_settings/settings_screen.dart';
import 'package:voltage_treasure_hunt/presentation/home_screen/Dashboard.dart';
import 'package:voltage_treasure_hunt/presentation/interactive_maps/map_screen.dart';

class HomePage extends StatefulWidget {
  final String name;
  final String email;

  final String firstName;
  const HomePage(
      {Key? key,
      required this.name,
      required this.email,
      required this.firstName})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final List<Widget> _pages;
  int _currentIndex = 0;
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _pages = [
      Dashboard(
        name: widget.name,
        email: widget.email,
        firstName: widget.firstName,
      ),
      MapScreen(),
      SettingsScreen(),
    ];

    final musicToggle = Provider.of<MusicToggle>(context, listen: false);

    // Observe changes in the MusicToggle state
    musicToggle.addListener(() {
      if (musicToggle.isToggled) {
        _loadAndPlayAudio();
      } else {
        _stopAudio();
      }
    });

    // Play audio initially
    if (musicToggle.isToggled) {
      _loadAndPlayAudio();
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void _loadAndPlayAudio() async {
  await player.setAsset('assets/audio/homepage.mp3');
  player.setVolume(0.25);
  player.play();

  player.playerStateStream.listen((playerState) {
    if (playerState.processingState == ProcessingState.completed) {
      // Audio has finished playing, so we play it again.
      player.seek(Duration.zero);
      player.play();
    }
  });
}

  void _stopAudio() {
    player.stop();
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
            icon: const Icon(Icons.map_rounded),
            title: const Text("Events"),
          ),
          SalomonBottomBarItem(
            selectedColor: Color(0xff5FCFA3),
            unselectedColor: Colors.grey,
            icon: const Icon(Icons.settings),
            title: const Text("Settings"),
          ),
        ],
      ),
    );
  }
}
