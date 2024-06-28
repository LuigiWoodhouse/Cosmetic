import 'package:cosplay/layout/account/profile.dart';
import 'package:cosplay/orders/view_current_order.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Orders',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 1),
            ),
            const SizedBox(height: 10),
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
                OrderOption(
                  icon: Icons.rate_review,
                  text: 'Review',
                  onPressed: () {
                    // Handle review order action
                  },
                ),
                OrderOption(
                  icon: Icons.assignment_return,
                  text: 'Return',
                  onPressed: () {
                    // Handle return order action
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Profile',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 1),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ProfileOption(
                  icon: Icons.person,
                  text: 'Personal',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonalInfoPage(),
                      ),
                    );
                  },
                ),
                ProfileOption(
                  icon: Icons.payment,
                  text: 'Payment',
                  onPressed: () {
                    // Handle payment info action
                  },
                ),
                ProfileOption(
                  icon: Icons.card_giftcard,
                  text: 'Coupons',
                  onPressed: () {
                    // Handle coupons action
                  },
                ),
                ProfileOption(
                  icon: Icons.security,
                  text: 'Security',
                  onPressed: () {
                    // Handle security action
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Customer Support',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 1),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SupportOption(
                  icon: Icons.confirmation_number,
                  text: 'Ticket',
                  onPressed: () {
                    // Handle ticket action
                  },
                ),
                SupportOption(
                  icon: Icons.lightbulb,
                  text: 'Suggestions',
                  onPressed: () {
                    // Handle suggestions action
                  },
                ),
                SupportOption(
                  icon: Icons.question_answer,
                  text: 'FAQ',
                  onPressed: () {
                    // Handle FAQ action
                  },
                ),
                SupportOption(
                  icon: Icons.support_agent,
                  text: 'Live Support',
                  onPressed: () {
                    // Handle live support action
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
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const ProfileOption({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class SupportOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const SupportOption({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}