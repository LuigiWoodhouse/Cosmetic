import 'package:cosplay/orders/view_current_order.dart';
import 'package:flutter/material.dart';


class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Account'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Orders',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 1),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                OrderOption(
                  icon: Icons.track_changes,
                  text: 'Track',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewCurrentOrder(),
                      ),
                    );
                  },
                ),
                OrderOption(
                  icon: Icons.view_list,
                  text: 'View',
                  onPressed: () {
                    // Handle view order action
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const OrderOption({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
        ),
        SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
