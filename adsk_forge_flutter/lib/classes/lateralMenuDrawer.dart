import 'package:adsk_forge_flutter/Router/appRouter.gr.dart';
import 'package:adsk_forge_flutter/components/componentsLibrary.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class LateralMenuDrawer extends StatefulWidget {
  const LateralMenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  _LateralMenuDrawerState createState() => _LateralMenuDrawerState();
}

class _LateralMenuDrawerState extends State<LateralMenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleProfilePicComponent(
                  profilePicRadius: 35,
                  backgroundColor: Colors.grey.shade200,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'profileName',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Text(
                  'profileEmail',
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.list_alt),
            title: Text('Hubs'),
            onTap: () {
              Navigator.pop(context);
              context.pushRoute(HubsViewRoute());
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Account'),
            onTap: () {
              Navigator.pop(context);
              context.pushRoute(AccountViewRoute());
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log out'),
            onTap: () {
              Navigator.pop(context);
              context.pushRoute(LoginViewRoute());
            },
          ),
        ],
      ),
    );
  }
}
