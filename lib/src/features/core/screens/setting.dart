import 'package:flutter/material.dart';

void main() {
  runApp(const SettingsApp());
}

class SettingsApp extends StatelessWidget {
  const SettingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;
  bool privacyEnabled = false;
  bool accountManagementEnabled = false;

  void _logOut() {
    // Logic to log out the user
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logged out successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Settings Options
            ListTile(
              title: Text('Notifications'),
              trailing: Switch(
                value: notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    notificationsEnabled = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Privacy Settings'),
              trailing: Switch(
                value: privacyEnabled,
                onChanged: (value) {
                  setState(() {
                    privacyEnabled = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Account Management'),
              trailing: Switch(
                value: accountManagementEnabled,
                onChanged: (value) {
                  setState(() {
                    accountManagementEnabled = value;
                  });
                },
              ),
            ),

            // Log Out Button
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _logOut,
              child: Text('Log Out'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Full-width button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
