import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_app/utils/routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white70,
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
              ),onTap: () {
                Navigator.pushNamed(context, MyRoutes.profileRoute);
              },
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
              onTap: () => logout(context),
            )
          ],
        ),
      ),
    );
  }

  logout (BuildContext context){ 
    const session = FlutterSecureStorage();
    session.deleteAll();
    Navigator.pushNamed(context, MyRoutes.loginRoute);
  }
}

