import 'package:flutter/material.dart';

import '../../widgets/drawer/drawer.dart';
import '../../widgets/text_frave.dart';

class dataUser extends StatelessWidget {
  const dataUser({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(209, 222, 234, 1),
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: TextFrave(
          text: "Palacio Del Aseo",
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 18,
          style: ('Roboto'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(50, 121, 187, 1),
                Color.fromARGB(66, 121, 121, 121)
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        elevation: 20,
        titleSpacing: 20,
      ),
      body: Center(
        child: Text(
          "DATA USER",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
