import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShoppCar extends StatelessWidget {
  const ShoppCar({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(209, 222, 234, 1),
      body: Center(
        child: Text(
          "SHOPPING CART",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
