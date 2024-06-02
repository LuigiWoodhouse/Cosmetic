import 'package:flutter/material.dart';

class CartIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // Navigate to cart page
        Navigator.pushNamed(context, '/cart'); // Replace with your cart route
      },
      icon: Icon(Icons.shopping_cart),
      color: Colors.pink,
    );
  }
}