import 'package:cosplay/layout/account.dart';
import 'package:cosplay/layout/cart.dart';
import 'package:cosplay/layout/home.dart';
import 'package:cosplay/layout/shop.dart';
import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/cart': (context) => CartPage(),
        '/shop': (context) => ShopPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Check for initial arguments and set the selected index
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final int? initialIndex = ModalRoute.of(context)?.settings.arguments as int?;
      if (initialIndex != null) {
        setState(() {
          _selectedIndex = initialIndex;
        });
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getPageWidget(int index) {
    switch (index) {
      case 0:
        return Home(); // Replace with your actual Home Page widget if needed
      case 1:
        return CartPage(); // Using your actual Cart Page widget
      case 2:
        return ShopPage(); // Using your actual Shop Page widget
      case 3:
        return AccountPage(); // Replace with your actual Account Page widget if needed
      default:
        return const SizedBox(); // Return a default widget
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text('E-commerce App'),
      ),
      body: Center(
        child: _getPageWidget(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Ensure items are properly aligned
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        onTap: _onItemTapped,
      ),
    );
  }
}