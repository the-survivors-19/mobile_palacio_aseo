import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShoppCar extends StatelessWidget {
  const ShoppCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "SHOPPING CART",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
