import 'package:flutter/material.dart';
import 'shop/lingerie.dart';
import 'shop/maid.dart';
import 'shop/sextoy.dart';

class SideNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 150,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.pink,
            ),
            child: Text(
              '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Maid'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MaidPage()),
              );
            },
          ),
          ListTile(
            title: Text('Lingerie'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LingeriePage()),
              );
            },
          ),
          ListTile(
            title: Text('Sex Toys'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SexToysPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}