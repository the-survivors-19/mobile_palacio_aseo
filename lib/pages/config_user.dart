import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palacio_aseo/models/user_response.dart';
import 'package:palacio_aseo/pages/User/dataUser.dart';
import 'package:palacio_aseo/widgets/text_frave.dart';

import '../widgets/drawer/drawer.dart';
import 'crud/crud categorias/categcrud.dart';
import 'crud/crud provedores/provcrud.dart';

class ConfigUser extends StatelessWidget {
  String token;
  UserResponse user;

  ConfigUser({
    Key? key,
    required this.token,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final imgUser =
        'https://www4.minijuegosgratis.com/v3/games/thumbnails/209606_1.jpg';
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
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(6),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(96),
                          child: Image.network(
                            imgUser,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            TextFrave(
                              text: 'BIENVENIDO!',
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 24,
                              style: ('Roboto'),
                            ),
                            SizedBox(height: 16),
                            TextFrave(
                              text: user.fullName,
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
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(20),
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
                              text: 'Provedores',
                              icon: Icons.workspaces_outline,
                              onClicked: () => selectedItem(context, 1),
                            ),
                            const SizedBox(height: 10),
                            buildMenuItem(
                              text: 'Categorias',
                              icon: CupertinoIcons.question_square,
                              onClicked: () => selectedItem(context, 2),
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
          builder: (context) => Datauser(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => crudProvedores("Provedores"),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => crudCateg("Categorias"),
        ));
        break;
    }
  }
}
