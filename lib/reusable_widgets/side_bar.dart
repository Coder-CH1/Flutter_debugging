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
        children: const [
          DrawerHeader(decoration: BoxDecoration(
              color: darkBlue,
            ),child:
          Text('Agbachi Chidiogo Melvis', style: TextStyle(color: whiteColor, fontSize: 22, fontWeight: FontWeight.w400),
          ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: darkBlue,),
            title: Text('Profile', style: TextStyle(color: darkBlue),),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: darkBlue,),
            title: Text('Settings & Privacy', style: TextStyle(color: darkBlue),),
          ),
        ],
      ),
    );
  }
}