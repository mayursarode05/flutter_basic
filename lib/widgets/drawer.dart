import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text("Mayur S"),
              accountEmail: Text("mayur.sarode@thinkbridge.in"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/boy.png"),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
            ),
            title: Text(
              "Home",
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.blueGrey,
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
            ),
            title: Text(
              "Profile",
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.blueGrey,
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail,
            ),
            title: Text(
              "Email Me",
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.blueGrey,
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.power,
            ),
            title: Text(
              "Logout",
            ),
            // onTap: logout(),
          )
        ],
      ),
    );
  }

  // logout (){
  //   Navigator.pop();
  // }
}
