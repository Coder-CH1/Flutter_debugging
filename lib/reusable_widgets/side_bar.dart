import 'package:flutter/material.dart';
import 'colors.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: whiteColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(decoration: BoxDecoration(
              color: darkBlue,
            ),child:
          Text('Agbachi Chidiogo Melvis', style: TextStyle(color: whiteColor, fontSize: 22, fontWeight: FontWeight.w400),
          ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: darkBlue,),
            title: const Text('Profile', style: TextStyle(color: darkBlue),),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile(title: 'Profile')),
              );
            },
          ),
           ListTile(
            leading: const Icon(Icons.settings, color: darkBlue,),
            title: const Text('Settings & Privacy', style: TextStyle(color: darkBlue),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile(title: 'Settings & Privacy')),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Profile extends StatelessWidget {
  final String title;
  const Profile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: darkBlue)),
      ),
      body: const Column(
        children: [

        ],
      )
    );
  }
}

class Settings extends StatelessWidget {
  final String title;
  const Settings({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: darkBlue)),
      ),
      body: const Column(
        children: [

        ],
      )
    );
  }
}
