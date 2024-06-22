import 'package:flutter/material.dart';

class ViewCurrentOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Current Order'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Current Order Status:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Stepper(
                steps: [
                  Step(
                    title: Text('Order Placed'),
                    content: Text('Your order has been placed.'),
                    isActive: true,
                  ),
                  Step(
                    title: Text('Order Processed'),
                    content: Text('Your order is being processed.'),
                    isActive: true,
                  ),
                  Step(
                    title: Text('Order Shipped'),
                    content: Text('Your order has been shipped.'),
                    isActive: true,
                  ),
                  Step(
                    title: Text('Order Delivered'),
                    content: Text('Your order has been delivered.'),
                    isActive: true,
                  ),
                ],
                currentStep: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
