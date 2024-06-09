import 'package:flutter/material.dart';

class CartIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // Navigate to the home page with the cart index
        Navigator.pushReplacementNamed(context, '/home', arguments: 1); // Pass the index of the cart page
      },
      icon: Icon(Icons.shopping_cart),
      color: Colors.pink,
    );
  }
}