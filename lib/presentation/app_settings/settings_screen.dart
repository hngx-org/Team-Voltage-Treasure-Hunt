import 'package:flutter/material.dart';
import 'package:voltage_treasure_hunt/presentation/authentication_screens/sign_in.dart';

import '../user_profile/edit_profile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          const SizedBox(
            height: 60,
          ),
          Card(
            elevation: 12,
            color: Colors.white,
            child: ListTile(
              title: const Text('Notification Settings'),
              subtitle: const Text('Customize your notification preferences'),
              leading: const Icon(Icons.notifications),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to notification settings
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Card(
            elevation: 12,
            color: Colors.white,
            child: ListTile(
              title: const Text('Account Settings'),
              subtitle: const Text('Manage your account details'),
              leading: const Icon(Icons.account_circle),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const EditProfileScreen(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Card(
            elevation: 12,
            color: Colors.white,
            child: ListTile(
              title: const Text('Privacy Settings'),
              subtitle: const Text('Control your privacy preferences'),
              leading: const Icon(Icons.privacy_tip),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to privacy settings
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Card(
            elevation: 12,
            color: Colors.white,
            child: ListTile(
              title: const Text('Theme'),
              subtitle: const Text('Change the app theme'),
              leading: const Icon(Icons.color_lens),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to theme settings
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Card(
            elevation: 12,
            color: Colors.white,
            child: ListTile(
              title: const Text('Log Out'),
              leading: const Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => SignIn())));
              },
            ),
          ),
        ],
      ),
    );
  }
}
