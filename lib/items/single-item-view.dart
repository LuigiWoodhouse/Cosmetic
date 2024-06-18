import 'package:cosplay/buttons/add-to-cart.dart';
import 'package:cosplay/buttons/cart-icon.dart';
import 'package:flutter/material.dart';

class MaidItemPage extends StatefulWidget {
  final List<String> imagePaths;
  final String name;
  final String price; // Add price field

  const MaidItemPage({
    Key? key,
    required this.imagePaths,
    required this.name,
    required this.price, // Add price to constructor
  }) : super(key: key);

  @override
  _MaidItemPageState createState() => _MaidItemPageState();
}

class _MaidItemPageState extends State<MaidItemPage> {
  int _currentPage = 0;
  String _selectedSize = '';

  final Map<String, Map<String, String>> sizeDetails = {
    'S': {'Bust': '32-34inches', 'Length': '29inches', 'Underbust': '28-30inches'},
    'M': {'Bust': '34-36inches', 'Length': '30inches', 'Underbust': '30-32inches'},
    'L': {'Bust': '36-38inches', 'Length': '31inches', 'Underbust': '32-34inches'},
    'XL': {'Bust': '38-40inches', 'Length': '32inches', 'Underbust': '34-36inches'},
  };

  void _selectSize(String size) {
    setState(() {
      _selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 6.0),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '\$${widget.price}', // Display price
                  style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 16.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.name,
                  style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 16.0),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: ['S', 'M', 'L', 'XL'].map((size) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ElevatedButton(
                        onPressed: () => _selectSize(size),
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              _selectedSize == size ? Colors.white : Colors.black,
                          backgroundColor:
                              _selectedSize == size ? Colors.black : Colors.white,
                          shape: StadiumBorder(), // Text color
                          minimumSize: Size(40, 40), // Width and height of the button
                        ),
                        child: Text(size),
                      ),
                    );
                  }).toList(),
                ),
              ),
              if (_selectedSize.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bust',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 8.0),
                          ),
                          SizedBox(height: 4),
                          Text(sizeDetails[_selectedSize]!['Bust']!, style: TextStyle(fontSize: 8.0)),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Length',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 8.0),
                          ),
                          SizedBox(height: 4),
                          Text(sizeDetails[_selectedSize]!['Length']!, style: TextStyle(fontSize: 8.0)),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Underbust',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 8.0),
                          ),
                          SizedBox(height: 4),
                          Text(sizeDetails[_selectedSize]!['Underbust']!, style: TextStyle(fontSize: 8.0)),
                        ],
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: AddToCartButton(
                        onPressed: () {
                          // Implement your add to cart logic here
                          print('Added ${widget.name} (${_selectedSize}) to cart.');
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
      ),
    );
  }
}
