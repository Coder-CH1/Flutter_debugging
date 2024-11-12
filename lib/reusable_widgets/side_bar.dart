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
            Icon(Icons.person, color: darkBlue, size: 100),
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
  List<String> items = ['lorem', 'lorem', 'lorem', 'lorem', 'lorem', 'lorem'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: darkBlue)),
        backgroundColor: lightBlue,
      ),
      body: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DetailsScreen())
          );
        },
        child: ListView.builder(
         itemCount: items.length,
        itemBuilder: (context, index ) {
          return Column(
            children: [
              SizedBox(
                height: 60,
                child: ListTile(
                  title: Text(items[index]),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios_sharp, color: Colors.grey),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                  height: 1,
                ),
              )
            ],
          );
        }
        ),
      )
    );
  }
}


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen', style: TextStyle(color: darkBlue)),
        leading: IconButton(
            onPressed: () {
             // logger.i('Navigating back from airtime & data screen');
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp, color: darkBlue)
        ),
        backgroundColor: lightBlue,
      ),
    );
  }
}
