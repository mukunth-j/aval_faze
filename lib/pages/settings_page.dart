import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Text('This is the Settings page.'),
      ),
    );
  }
}
