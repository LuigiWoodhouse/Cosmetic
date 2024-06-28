import 'package:cosplay/items/item.dart';
import 'package:cosplay/items/single-item-view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NursePage extends StatelessWidget {
  const NursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          itemCount: nurseItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MaidItemPage(
                      imagePaths: nurseItems[index].imagePaths,
                      name: nurseItems[index].name,
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
                        nurseItems[index].imagePaths[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        nurseItems[index].name,
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

// List of nurse items with multiple image paths and names
final List<ShopItem> nurseItems = [
  ShopItem(imagePaths: ['lib/assets/nurse1_1.png', 'lib/assets/nurse1_2.png'], name: 'Nurse 1'),
  ShopItem(imagePaths: ['lib/assets/nurse2_1.png', 'lib/assets/nurse2_2.png'], name: 'Nurse 2'),
  ShopItem(imagePaths: ['lib/assets/nurse3_1.png', 'lib/assets/nurse3_2.png'], name: 'Nurse 3'),
];
