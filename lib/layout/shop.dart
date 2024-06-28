import 'package:cosplay/items/item.dart';
import 'package:cosplay/items/nurse.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2, // Update the length as you add more categories
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Maid'),
                Tab(text: 'Nurse'),
                // Add more tabs here if you have more categories
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  MaidPage(),
                  NursePage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}