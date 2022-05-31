import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:palacio_aseo/pages/config_user.dart';
import 'package:palacio_aseo/pages/home_page.dart';
import 'package:palacio_aseo/pages/shopp_cart.dart';
import 'package:palacio_aseo/widgets/drawer/drawer.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 1;

  final screens = [
    ShoppCar(),
    HomePage(),
    ConfigUser(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.shopping_cart),
      Icon(Icons.home),
      Icon(Icons.account_circle)
    ];
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text("Palacio Del Aseo"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
        //backgroundColor: Colors.purple,
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
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        child: CurvedNavigationBar(
          key: navigationKey,
          height: 55,
          animationCurve: Curves.easeInOutCirc,
          color: Color.fromRGBO(50, 121, 187, 1),
          buttonBackgroundColor: Color.fromARGB(255, 43, 104, 160),
          backgroundColor: Colors.transparent,
          animationDuration: Duration(milliseconds: 250),
          index: index,
          items: items,
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
