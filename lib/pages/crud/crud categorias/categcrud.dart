import 'package:flutter/material.dart';
import 'package:palacio_aseo/pages/crud/crud%20categorias/messconfirm.dart';
import 'package:palacio_aseo/pages/crud/crud%20categorias/categmodif.dart';
import 'package:palacio_aseo/pages/crud/crud%20categorias/categregister.dart';
import '../../../widgets/drawer/drawer.dart';
import '../../../widgets/text_frave.dart';

class crudCateg extends StatefulWidget {
  final String _title;
  crudCateg(this._title);
  @override
  State<StatefulWidget> createState() => _HomeCateg();
}

class _HomeCateg extends State<crudCateg> {
  List<Categ> categories = [
    Categ(
      description: 'Jabones',
    ),
    Categ(
      description: 'Limpia Pisos',
    ),
    Categ(
      description: 'Aromatizantes',
    ),
    Categ(
      description: 'Utencilios',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(209, 222, 234, 1),
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: TextFrave(
          text: "Categorias",
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
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ModifyCateg(categories[index])))
                  .then((newCategorie) {
                if (newCategorie != null) {
                  setState(() {
                    categories.removeAt(index);

                    categories.insert(index, newCategorie);

                    messageResponse(context,
                        newCategorie.description + " ha sido modificada!");
                  });
                }
              });
            },
            onLongPress: () {
              removeClient(context, categories[index]);
            },
            title: Text(categories[index].description),
            leading: CircleAvatar(
              child: Icon(Icons.category),
            ),
            trailing: Icon(
              Icons.edit,
              color: Color.fromRGBO(50, 121, 187, 1),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(50, 121, 187, 1),
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RegisterCateg()))
              .then((newCateg) {
            if (newCateg != null) {
              setState(() {
                categories.add(newCateg);
                messageResponse(
                    context, newCateg.description + " ha sido creada");
              });
            }
          });
        },
        tooltip: "Agregar Categoria",
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  removeClient(BuildContext context, Categ client) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar Categoria"),
              content:
                  Text("Esta seguro de eliminar " + client.description + "?"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      this.categories.remove(client);
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

class Categ {
  var description;

  Categ({this.description});
}
