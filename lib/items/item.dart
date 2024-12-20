import 'package:cosplay/items/single-item-view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MaidPage extends StatelessWidget {
  const MaidPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          itemCount: maidItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MaidItemPage(
                      imagePaths: maidItems[index].imagePaths,
                      name: maidItems[index].name,
                      price: '1000 JMD',
                    ),
                  ),
                );
              },
              child: Card(
                clipBehavior: Clip.antiAlias, // Ensures the content fits within the card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        maidItems[index].imagePaths[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        maidItems[index].name,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontSize: 16.0, // Adjust the font size here
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, index.isEven ? 3 : 2),
        ),
      ),
    );
  }
}

class ShopItem {
  final List<String> imagePaths;
  final String name;

  ShopItem({required this.imagePaths, required this.name});
}

// List of maid items with multiple image paths and names
final List<ShopItem> maidItems = [
  ShopItem(imagePaths: ['lib/assets/maid1_1.png', 'lib/assets/maid1_2.png'], name: 'Maid 1'),
  ShopItem(imagePaths: ['lib/assets/maid2_1.png', 'lib/assets/maid2_2.png'], name: 'Maid 2'),
  ShopItem(imagePaths: ['lib/assets/maid3_1.png', 'lib/assets/maid3_2.png'], name: 'Maid 3'),
  ShopItem(imagePaths: ['lib/assets/maid4_1.png', 'lib/assets/maid4_2.png'], name: 'Maid 4'),
  ShopItem(imagePaths: ['lib/assets/maid5_1.png', 'lib/assets/maid5_2.png'], name: 'Maid 5'),
];