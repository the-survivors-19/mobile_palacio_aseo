import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:palacio_aseo/pages/config_user.dart';
import 'package:palacio_aseo/pages/home_page.dart';
import 'package:palacio_aseo/pages/shopp_cart.dart';
import 'package:palacio_aseo/widgets/drawer/drawer.dart';
import 'package:palacio_aseo/widgets/text_frave.dart';

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
      Icon(Icons.filter_vintage)
    ];
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
