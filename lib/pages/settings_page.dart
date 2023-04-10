import 'package:aval/pages/home_page.dart';
import 'package:aval/pages/update_profile.dart';
import 'package:aval/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(LineAwesomeIcons.angle_left),
            color: Colors.black),
        title:
            Text('Profile', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon),
              color: Colors.black)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Image(
                              image: AssetImage("assets/image/profile.jpg")))),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blueAccent.withOpacity(0.5),
                      ),
                      child: const Icon(LineAwesomeIcons.alternate_pencil,
                          color: Colors.black, size: 20.0)),
                )
              ],
            ),
            const SizedBox(height: 10),
            Text(u_name, style: Theme.of(context).textTheme.headlineMedium),
            Text(u_mail, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text("Edit Profile",
                      style: TextStyle(color: Colors.white))),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),
            SettingsMenu(
                title: " Security Settings",
                icon: LineAwesomeIcons.cog,
                onPress: () {}),
            SettingsMenu(
                title: "Safety Sharing",
                icon: LineAwesomeIcons.helping_hands,
                onPress: () {}),
            SettingsMenu(
                title: "User Management",
                icon: LineAwesomeIcons.user_check,
                onPress: () {}),
            const Divider(color: Colors.grey),
            const SizedBox(height: 10),
            SettingsMenu(
                title: "AI Detection",
                icon: LineAwesomeIcons.identification_badge,
                onPress: () {}),
            SettingsMenu(
                title: "IoT Wearables - Jewels",
                icon: LineAwesomeIcons.accessible_icon,
                onPress: () {}),
            SettingsMenu(
                title: "Log Out",
                icon: LineAwesomeIcons.alternate_sign_out,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {}),
          ]),
        ),
      ),
    );
  }
}

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({
    Key? key, // add Key? key parameter
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = false,
    this.textColor,
  }) : super(key: key); // pass key to super constructor

  final String title;
  final IconData? icon; // add ? to IconData for null safety
  final VoidCallback? onPress; // add ? to VoidCallback for null safety
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onPress,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.blueAccent.withOpacity(0.1),
          ),
          child: Icon(icon, color: Colors.blueAccent),
        ),
        title: Text(title,
            style:
                Theme.of(context).textTheme.bodyLarge?.apply(color: textColor)),
        trailing: endIcon
            ? Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.blueAccent.withOpacity(0.1),
                ),
                child: const Icon(LineAwesomeIcons.angle_right,
                    size: 18.0, color: Colors.grey))
            : null);
  }
}
