import 'package:flutter/material.dart';

class LogoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: MediaQuery.of(context).size.width * 0.32,
      child: Container(
        height: 200,
        width: 200,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(50), boxShadow: [
          BoxShadow(blurRadius: 60, color: Color.fromARGB(66, 121, 121, 121))
        ]),
        child: Image.asset('logopa.png'),
      ),
    );
  }
}
