import 'package:cosplay/buttons/add-to-cart.dart';
import 'package:cosplay/buttons/cart-icon.dart'; // Import your CartIconButton class
import 'package:flutter/material.dart';

class MaidItemPage extends StatelessWidget {
  final String imagePath;
  final String name;

  const MaidItemPage({Key? key, required this.imagePath, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10.0),
            Text(
              name,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 100.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: AddToCartButton(
                      onPressed: () {
                        // Implement your add to cart logic here
                        print('Added $name to cart.');
                      },
                    ),
                  ),
                  SizedBox(width: 10), // Adjust the spacing as needed
                  CartIconButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
