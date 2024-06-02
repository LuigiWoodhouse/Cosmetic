import 'package:cosplay/shop/maid-item.dart';
import 'package:flutter/material.dart';

class MaidPage extends StatelessWidget {
  const MaidPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Maid')),
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
                      imagePath: maidItems[index].imagePath,
                      name: maidItems[index].name,
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
                        maidItems[index].imagePath,
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
  final String imagePath;
  final String name;

  MaidItem({required this.imagePath, required this.name});
}

// List of maid items with image paths and names
final List<MaidItem> maidItems = [
  MaidItem(imagePath: 'lib/assets/maid1.png', name: 'Maid 1'),
  MaidItem(imagePath: 'lib/assets/maid2.png', name: 'Maid 2'),
  MaidItem(imagePath: 'lib/assets/maid3.png', name: 'Maid 3'),
];
