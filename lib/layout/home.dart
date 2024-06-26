import 'dart:async';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.8,
  );
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce App'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to the cart page
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Featured Products',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                height: 600,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard(
                      imageUrl: _buildImageUrl(index),
                      name: 'Product ${index + 1}',
                      price: '\$${(index + 1) * 100}',
                    );
                  },
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Popular Items',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Column(
                children: <Widget>[
                  ProductCard(
                    imageUrl: 'https://via.placeholder.com/150',
                    name: 'Product 4',
                    price: '\$400',
                  ),
                  ProductCard(
                    imageUrl: 'https://via.placeholder.com/150',
                    name: 'Product 5',
                    price: '\$500',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _buildImageUrl(int index) {
    switch (index) {
      case 0:
        return 'https://www.dollskill.com/cdn/shop/products/h9ZI55mEdDg3LCABXmMcpqnr3Ve6IraN-24.jpg?v=1682834329';
      case 1:
        return 'https://m.media-amazon.com/images/I/61zycaXRWmL._AC_SX679_.jpg';
      case 2:
        return 'https://m.media-amazon.com/images/I/61BO600jz2L._AC_SY741_.jpg';
      default:
        return 'https://via.placeholder.com/150';
    }
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(imageUrl, fit: BoxFit.cover),
          SizedBox(height: 5),
          Text(
            name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            price,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String name;

  const CategoryCard({
    Key? key,
    required this.icon,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blue,
          child: Icon(icon, size: 30, color: Colors.white),
        ),
        SizedBox(height: 5),
        Text(name),
      ],
    );
  }
}