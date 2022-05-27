import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ConfigUser extends StatelessWidget {
  const ConfigUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "USER SETTINGS",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
