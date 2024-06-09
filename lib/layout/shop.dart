import 'package:cosplay/items/item.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1, // Update the length as you add more categories
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Maid'),
                // Add more tabs here if you have more categories
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  MaidPage(),
                  // Add more pages here corresponding to the tabs
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}