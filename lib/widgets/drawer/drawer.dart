import 'package:flutter/material.dart';
import 'package:palacio_aseo/pages/User/dataUser.dart';
import 'package:palacio_aseo/pages/config_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:palacio_aseo/pages/crud/crud%20provedores/provcrud.dart';

import '../../pages/crud/crud categorias/categcrud.dart';

class DrawerMenu extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Paul Zuluaga';
    final email = 'paul@gmail.com';
    final urlImage =
        'https://www4.minijuegosgratis.com/v3/games/thumbnails/209606_1.jpg';

    return Drawer(
      child: Material(
        color: Color.fromRGBO(50, 121, 187, 1),
        child: ListView(children: <Widget>[
          buildHeader(
            urlImage: urlImage,
            name: name,
            email: email,
            onClicked: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Datauser(),
            )),
          ),
          Container(
              padding: padding,
              child: Column(children: [
                const SizedBox(height: 6),
                Divider(color: Colors.white70),
                const SizedBox(height: 6),
                buildMenuItem(
                  text: 'Perfil',
                  icon: CupertinoIcons.person,
                  onClicked: () => selectedItem(context, 0),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Provedores',
                  icon: Icons.workspaces_outline,
                  onClicked: () => selectedItem(context, 1),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Categorias',
                  icon: CupertinoIcons.question_square,
                  onClicked: () => selectedItem(context, 2),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Categorias',
                  icon: CupertinoIcons.pencil_circle_fill,
                  onClicked: () => selectedItem(context, 3),
                ),
                const SizedBox(height: 24),
                Divider(color: Colors.white70),
                const SizedBox(height: 24),
                buildMenuItem(
                    text: 'Salir',
                    icon: CupertinoIcons.square_arrow_left,
                    onClicked: () => {
                          Navigator.pushNamedAndRemoveUntil(
                              context, 'login', (route) => false)
                        }),
              ])),
        ]),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

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
          builder: (context) => ConfigUser(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => crudProvedores("Provedores"),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => crudCateg("Categods"),
        ));
        break;
    }
  }
}
