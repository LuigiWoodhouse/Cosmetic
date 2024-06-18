import 'package:cosplay/items/single-item-view.dart';
import 'package:flutter/material.dart';

class MaidPage extends StatelessWidget {
  const MaidPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Maid')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: maidItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MaidItemPage(
                      imagePaths: maidItems[index].imagePaths,
                      name: maidItems[index].name, price: '1000 JMD',
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
        ),
      ),
    );
  }
}

class MaidItem {
  final List<String> imagePaths;
  final String name;

  MaidItem({required this.imagePaths, required this.name});
}

// List of maid items with multiple image paths and names
final List<MaidItem> maidItems = [
  MaidItem(imagePaths: ['lib/assets/maid1_1.png', 'lib/assets/maid1_2.png'], name: 'Maid 1'),
  MaidItem(imagePaths: ['lib/assets/maid2_1.png', 'lib/assets/maid2_2.png'], name: 'Maid 2'),
  MaidItem(imagePaths: ['lib/assets/maid3_1.png', 'lib/assets/maid3_2.png'], name: 'Maid 3'),
];