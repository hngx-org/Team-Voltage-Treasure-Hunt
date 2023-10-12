import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Card(
            elevation: 12,
            color: Colors.white,
            child: ListTile(
              title: Text('Notification Settings'),
              subtitle: Text('Customize your notification preferences'),
              leading: Icon(Icons.notifications),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to notification settings
              },
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Card(
            elevation: 12,
            color: Colors.white,
            child: ListTile(
              title: Text('Account Settings'),
              subtitle: Text('Manage your account details'),
              leading: Icon(Icons.account_circle),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to account settings
              },
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Card(
            elevation: 12,
            color: Colors.white,
            child: ListTile(
              title: Text('Privacy Settings'),
              subtitle: Text('Control your privacy preferences'),
              leading: Icon(Icons.privacy_tip),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to privacy settings
              },
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Card(
            elevation: 12,
            color: Colors.white,
            child: ListTile(
              title: Text('Theme'),
              subtitle: Text('Change the app theme'),
              leading: Icon(Icons.color_lens),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to theme settings
              },
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Card(
            elevation: 12,
            color: Colors.white,
            child: ListTile(
              title: Text('Log Out'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                // Handle user logout
              },
            ),
          ),
        ],
      ),
    );
  }
}
