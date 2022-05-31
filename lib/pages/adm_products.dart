import 'package:flutter/material.dart';
import 'package:palacio_aseo/widgets/drawer/drawer.dart';

import '../widgets/navigatorbar.dart';

class AdmProduc extends StatelessWidget {
  const AdmProduc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text("Palacio del Aseo"),
      ),
      body: Center(
        child: Text(
          "PROVIDERS",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
