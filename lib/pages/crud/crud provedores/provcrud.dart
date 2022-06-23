import 'package:flutter/material.dart';
import 'package:palacio_aseo/pages/crud/crud%20provedores/messconfirm.dart';
import 'package:palacio_aseo/pages/crud/crud%20provedores/provmodif.dart';
import 'package:palacio_aseo/pages/crud/crud%20provedores/provregister.dart';

import '../../../widgets/drawer/drawer.dart';
import '../../../widgets/text_frave.dart';

class crudProvedores extends StatefulWidget {
  final String _title;
  crudProvedores(this._title);
  @override
  State<StatefulWidget> createState() => _HomeProv();
}

class _HomeProv extends State<crudProvedores> {
  List<Provider> providers = [
    Provider(
        name: 'Petro Presidente',
        email: 'petrodios@gmail.com',
        phone: '3024542593',
        dutym: 'Colombia',
        address: 'Olimpo'),
    Provider(
        name: 'Rodolfo Cachetadon',
        email: 'viejito@gmail.com',
        phone: '322 412 34 68',
        dutym: 'Mafia',
        address: 'Cra 70 #ijue-puta'),
    Provider(
        name: 'Fico Perico',
        email: 'elsocio@gmail.com',
        phone: '3014413698',
        dutym: 'Barrios Bajos',
        address: 'Calle #Bronx'),
    Provider(
      name: 'Jhon Milton',
      email: 'quienteconoce@gmail.com',
      phone: '3107899062',
      dutym: 'Nose',
      address: 'Cra # ????',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(209, 222, 234, 1),
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: TextFrave(
          text: "Provedores",
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
        itemCount: providers.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ModifyContact(providers[index])))
                  .then((newProvider) {
                if (newProvider != null) {
                  setState(() {
                    providers.removeAt(index);

                    providers.insert(index, newProvider);

                    messageResponse(
                        context, newProvider.name + " ha sido modificado!");
                  });
                }
              });
            },
            onLongPress: () {
              removeClient(context, providers[index]);
            },
            title: Text(providers[index].name),
            subtitle:
                Text(providers[index].phone + " - " + providers[index].dutym),
            leading: CircleAvatar(
              child: Text(providers[index].name.substring(0, 1)),
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
          Navigator.push(context,
                  MaterialPageRoute(builder: (_) => RegisterProvider()))
              .then((newContact) {
            if (newContact != null) {
              setState(() {
                providers.add(newContact);
                messageResponse(context, newContact.name + " ha sido guardado");
              });
            }
          });
        },
        tooltip: "Agregar Contacto",
        child: Icon(
          Icons.person_add,
          color: Colors.white,
        ),
      ),
    );
  }

  removeClient(BuildContext context, Provider client) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar Cliente"),
              content: Text("Esta seguro de eliminar a " + client.name + "?"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      this.providers.remove(client);
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

class Provider {
  var name;
  var email;
  var phone;
  var dutym;
  var address;

  Provider({this.name, this.email, this.phone, this.dutym, this.address});
}
