import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palacio_aseo/widgets/text_frave.dart';

import '../widgets/navigatorbar.dart';
import 'User/dataUser.dart';

class ConfigUser extends StatelessWidget {
  const ConfigUser({key});

  @override
  Widget build(BuildContext context) {
    final imgUser =
        'https://www4.minijuegosgratis.com/v3/games/thumbnails/209606_1.jpg';
    return Scaffold(
      backgroundColor: Color.fromRGBO(209, 222, 234, 1),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 2, left: 16, right: 16, bottom: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(96),
                          child: Image.network(
                            imgUser,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: const [
                            TextFrave(
                              text: 'BIENVENIDO!',
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 24,
                              style: ('Roboto'),
                            ),
                            SizedBox(height: 16),
                            TextFrave(
                              text: "Paul Zuluaga",
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18,
                              style: ('Roboto'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(159, 199, 235, 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 6),
                            buildMenuItem(
                              text: 'Editar Perfil',
                              icon: CupertinoIcons.doc_person_fill,
                              onClicked: () => selectedItem(context, 0),
                            ),
                            const SizedBox(height: 10),
                            buildMenuItem(
                              text: 'Mis Comentarios',
                              icon: CupertinoIcons.ellipses_bubble_fill,
                              onClicked: () => selectedItem(context, 1),
                            ),
                            const SizedBox(height: 10),
                            buildMenuItem(
                              text: ' Mis PQRS',
                              icon: CupertinoIcons.news_solid,
                              onClicked: () => selectedItem(context, 2),
                            ),
                            const SizedBox(height: 10),
                            buildMenuItem(
                              text: 'Mis Compras',
                              icon: CupertinoIcons.money_dollar_circle_fill,
                              onClicked: () => selectedItem(context, 3),
                            ),
                            const SizedBox(height: 6),
                          ])),
                ],
              )),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Color.fromARGB(255, 0, 0, 0);
    final hoverColor = Color.fromARGB(179, 0, 0, 0);

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => dataUser(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NavBar(),
        ));
        break;
    }
  }
}
