import 'package:flutter/material.dart';
import 'login.dart';
import 'sidenav.dart';

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
        '/sidenav': (context) => SideNav(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}

// Replace this with your actual CartPage widget
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: Center(child: Text('Your Cart Items')),
    );
  }
}
