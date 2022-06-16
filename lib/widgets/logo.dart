import 'package:flutter/material.dart';

class LogoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 240,
        width: 240,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(blurRadius: 20, color: Color.fromRGBO(121, 121, 121, 0.259))
        ]),
        child: Image.asset('assets/logopa.png'),
      ),
    );
  }
}
