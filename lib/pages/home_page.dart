import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(209, 222, 234, 1),
        body: Container(
      padding: const EdgeInsets.all(5),
      alignment: Alignment.topRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 50,
            child: OutlinedButton(
              onPressed: () {},
              child: Text('Categorias'),
            ),
          ),
          Container(
            height: 50,
            child: OutlinedButton(
              onPressed: () {},
              child: Text('Categorias'),
            ),
          )
        ],
      ),
    ));
  }
}
