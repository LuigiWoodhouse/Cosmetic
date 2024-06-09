import 'package:cosplay/buttons/add-to-cart.dart';
import 'package:cosplay/buttons/cart-icon.dart'; // Import your CartIconButton class
import 'package:flutter/material.dart';

class MaidItemPage extends StatefulWidget {
  final List<String> imagePaths;
  final String name;

  const MaidItemPage({Key? key, required this.imagePaths, required this.name}) : super(key: key);

  @override
  _MaidItemPageState createState() => _MaidItemPageState();
}

class _MaidItemPageState extends State<MaidItemPage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 450.0, // Adjust the height of the PageView
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: widget.imagePaths.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        widget.imagePaths[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        '${_currentPage + 1}/${widget.imagePaths.length}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              widget.name,
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
                        print('Added ${widget.name} to cart.');
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