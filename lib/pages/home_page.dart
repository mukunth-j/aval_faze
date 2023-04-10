import 'package:aval/pages/chat_page.dart';
import 'package:aval/pages/map_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = -1;

  static List<Widget> _widgetOptions = <Widget>[
    ChatPage(),
    MapPage(),
    Text('Index 2: Tips'),
    SettingsPage(), // new page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _widgetOptions[_selectedIndex]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            'Aval SOS',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: IconTheme(
              data: IconThemeData(
                color: Colors.redAccent,
                size: 35.0,
              ),
              child: IconButton(onPressed: () {}, icon: Icon(Icons.sos))),
        ),
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              iconSize: 25,
              gap: 10,
              selectedIndex: _selectedIndex,
              onTabChange: _onItemTapped,
              padding: EdgeInsets.all(16),
              tabs: [
                GButton(
                  icon: Icons.chat_bubble_outline,
                  text: 'Chat',
                ),
                GButton(
                  icon: Icons.location_pin,
                  text: 'Location',
                ),
                GButton(icon: Icons.tips_and_updates, text: 'Tips'),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300.0,
                height: 300.0,
                child: Image.asset('assets/image/homepage_cop2.jpg'),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 200.0,
                height: 200.0,
                child: ClipOval(
                  child: ElevatedButton(
                      onPressed: () {
                        // TODO: Add SOS functionality here.
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        textStyle: TextStyle(fontSize: 40.0),
                      ),
                      child: Text('SOS')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
