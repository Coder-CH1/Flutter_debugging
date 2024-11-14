import 'package:flutter/material.dart';
import '../logger/logger.dart';
import 'colors.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkBlue,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(decoration: BoxDecoration(
              color: darkBlue,
            ),child:
          Text('Agbachi Chidiogo Melvis', style: TextStyle(color: lightBlue, fontSize: 22, fontWeight: FontWeight.w400),
          ),
          ),
          ListTile(
            leading: const Icon(Icons.person_pin, color: lightBlue,),
            title: const Text('Profile', style: TextStyle(color: lightBlue),),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile(title: 'Profile')),
              );
            },
          ),
           ListTile(
            leading: const Icon(Icons.settings, color: lightBlue,),
            title: const Text('Settings & Privacy', style: TextStyle(color: lightBlue),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Settings(title: 'Settings & Privacy')),
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
        backgroundColor: lightBlue,
      ),
      body: const Center(
        child: Column(
          children: [
            Icon(Icons.person_pin, color: lightBlue, size: 100),
            Text(''),
            Text(''),
            Text('')
          ],
        ),
      )
    );
  }
}

class Settings extends StatefulWidget {
  final String title;
  const Settings({super.key, required this.title});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<String> items = ['Light / Dark Mode', 'Contact Us', 'dolor', 'sit', 'amet', 'consectetur'];

  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: darkBlue)),
        backgroundColor: lightBlue,
      ),
      body: ListView.builder(
       itemCount: items.length,
      itemBuilder: (context, index ) {
         String currentItem = items[index];
         bool isSwitchEnabled = currentItem == 'Light / Dark Mode';
        return Column(
          children: [
            SizedBox(
              //color: darkBlue,
              height: 60,
              child: InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text(items[index], style: const TextStyle(
                    color: lightBlue,
                  ),
                  ),
                  trailing: isSwitchEnabled  ? Switch(
                      value: isSwitchOn,
                      onChanged: (bool newValue) {
                      setState(() {
                      isSwitchOn = newValue;
                        });
                      },
                  ) :
                      const Text(''),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                color: lightBlue,
                thickness: 1,
                height: 1,
              ),
            )
          ],
        );
      }
      )
    );
  }
}

class DolorScreen extends StatelessWidget {
  const DolorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dolor Screen', style: TextStyle(color: darkBlue)),
        leading: IconButton(
            onPressed: () {
               logger.i('Navigating back from airtime & data screen');
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp, color: darkBlue)
        ),
        backgroundColor: lightBlue,
      ),
    );
  }
}

class SitScreen extends StatelessWidget {
  const SitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sit Screen', style: TextStyle(color: darkBlue)),
        leading: IconButton(
            onPressed: () {
               logger.i('Navigating back from airtime & data screen');
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp, color: darkBlue)
        ),
        backgroundColor: lightBlue,
      ),
    );
  }
}

class AmetScreen extends StatelessWidget {
  const AmetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Amet Screen', style: TextStyle(color: darkBlue)),
        leading: IconButton(
            onPressed: () {
               logger.i('Navigating back from airtime & data screen');
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp, color: darkBlue)
        ),
        backgroundColor: lightBlue,
      ),
    );
  }
}

class Consectetur extends StatelessWidget {
  const Consectetur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consectetur Screen', style: TextStyle(color: darkBlue)),
        leading: IconButton(
            onPressed: () {
               logger.i('Navigating back from airtime & data screen');
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp, color: darkBlue)
        ),
        backgroundColor: lightBlue,
      ),
    );
  }
}
