import 'package:flutter/material.dart';
import 'package:palacio_aseo/pages/adm_products.dart';
import 'package:palacio_aseo/widgets/navigatorbar.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Paul7'),
            accountEmail: Text('paul@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.black,
              child: Text(
                'P7',
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          ListTile(
            title: Text('Administrar productos'),
            leading: Icon(Icons.table_view),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => AdmProduc())),
          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.perm_contact_cal),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => NavBar())),
          ),
        ],
      ),
    );
  }
}
