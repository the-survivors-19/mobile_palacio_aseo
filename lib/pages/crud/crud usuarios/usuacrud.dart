import 'package:flutter/material.dart';
import 'package:palacio_aseo/pages/crud/crud%20usuarios/messconfirm.dart';
import 'package:palacio_aseo/pages/crud/crud%20usuarios/usuamodif.dart';
import 'package:palacio_aseo/pages/crud/crud%20usuarios/usuaregister.dart';

import '../../../widgets/drawer/drawer.dart';
import '../../../widgets/text_frave.dart';

class crudUsuarios extends StatefulWidget {
  final String _title;
  crudUsuarios(this._title);
  @override
  State<StatefulWidget> createState() => _HomeUsua();
}

class _HomeUsua extends State<crudUsuarios> {
  List<User> usuarios = [
    User(
        name: 'Juan Martinez',
        email: 'juanito@gmail.com',
        phone: '3024542593',
        password: 'contraseña',
        address: 'Cra 4 #121 - 2'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(209, 222, 234, 1),
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: TextFrave(
          text: "Usuarios",
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
      body: ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ModifyUser(usuarios[index])))
                    .then((newUser) {
                  if (newUser != null) {
                    setState(() {
                      usuarios.removeAt(index);

                      usuarios.insert(index, newUser);

                      messageResponse(
                          context, newUser.name + " ha sido modificado!");
                    });
                  }
                });
              },
              onLongPress: () {
                removeClient(context, usuarios[index]);
              },
              title: Text(usuarios[index].name),
              subtitle:
                  Text(usuarios[index].email + "\n" + usuarios[index].phone),
              leading: CircleAvatar(
                child: Text(usuarios[index].name.substring(0, 1)),
              ),
              trailing: Icon(
                Icons.edit,
                color: Color.fromRGBO(50, 121, 187, 1),
              ),
              isThreeLine: true,
              tileColor: Color.fromARGB(255, 255, 255, 255),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(50, 121, 187, 1),
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RegisterUser()))
              .then((newContact) {
            if (newContact != null) {
              setState(() {
                usuarios.add(newContact);
                messageResponse(context, newContact.name + " ha sido guardado");
              });
            }
          });
        },
        tooltip: "Agregar Usuario",
        child: Icon(
          Icons.person_add,
          color: Colors.white,
        ),
      ),
    );
  }

  removeClient(BuildContext context, User client) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar Usuario"),
              content: Text("Esta seguro de eliminar a " + client.name + "?"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      this.usuarios.remove(client);
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ));
  }
}

class User {
  var name;
  var email;
  var phone;
  var password;
  var address;

  User({this.name, this.email, this.phone, this.password, this.address});
}
