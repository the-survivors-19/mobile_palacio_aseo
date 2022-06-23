import 'package:flutter/material.dart';
import 'package:palacio_aseo/widgets/widgets.dart';

import '../../widgets/drawer/drawer.dart';

class Datauser extends StatefulWidget {
  const Datauser({key});
  @override
  Widget build(BuildContext context) {
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
    );
  }

  State<Datauser> createState() => _data();
}

class _data extends State<Datauser> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _directionController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordrController = TextEditingController();
  TextEditingController _passwordconfirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final urlProfile =
      'https://www4.minijuegosgratis.com/v3/games/thumbnails/209606_1.jpg';
  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        padding: const EdgeInsets.only(top: 0),
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(color: Color.fromRGBO(159, 199, 235, 1), height: 120),
              Positioned(
                bottom: -40,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(209, 222, 234, 1),
                            spreadRadius: 4),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(urlProfile),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 50),
          Container(
            width: double.infinity,
            height: 50,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Paul Zuluaga",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SingleChildScrollView(
                              child: AlertDialog(
                                title: TextFormField(
                                  controller: _nameController,
                                  autofocus: true,
                                  autocorrect: true,
                                  keyboardType: TextInputType.text,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: validateName,
                                  decoration: InputDecoration(
                                      hintText: "Nuevo Nombre",
                                      labelText: "Nombre Completo",
                                      prefixIcon: Icon(Icons.person),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                                actions: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 16, left: 16),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(50, 121, 187, 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextButton(
                                      child: const TextFrave(
                                        text: 'Cancelar',
                                        color: Colors.white,
                                        fontSize: 18,
                                        style: ('Roboto'),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 60),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 16, right: 16),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(50, 121, 187, 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextButton(
                                      child: const TextFrave(
                                        text: 'Enviar',
                                        color: Colors.white,
                                        fontSize: 18,
                                        style: ('Roboto'),
                                      ),
                                      onPressed: () {
                                        print(
                                            "New Name: ${_nameController.text}");
                                        Navigator.pop(context);
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                    "Se ha editado el nombre!"),
                                                actions: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 16,
                                                            right: 16),
                                                    decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            50, 121, 187, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: TextButton(
                                                      child: const TextFrave(
                                                        text: 'Aceptar',
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        style: ('Roboto'),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .push(
                                                                MaterialPageRoute(
                                                          builder: (context) =>
                                                              Datauser(),
                                                        ));
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: AlertDialog(
                        title: TextFormField(
                          controller: _phoneController,
                          autofocus: true,
                          autocorrect: true,
                          keyboardType: TextInputType.phone,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: validatePhone,
                          decoration: InputDecoration(
                              labelText: "Nuevo Numero de Telefono",
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                        actions: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 16, left: 16),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(50, 121, 187, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextButton(
                              child: const TextFrave(
                                text: 'Cancelar',
                                color: Colors.white,
                                fontSize: 18,
                                style: ('Roboto'),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          SizedBox(width: 60),
                          Container(
                            margin:
                                const EdgeInsets.only(bottom: 16, right: 16),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(50, 121, 187, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextButton(
                              child: const TextFrave(
                                text: 'Enviar',
                                color: Colors.white,
                                fontSize: 18,
                                style: ('Roboto'),
                              ),
                              onPressed: () {
                                print("New Phone: ${_phoneController}");
                                Navigator.pop(context);
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title:
                                            Text("Se ha editado tu telefono!"),
                                        actions: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 16, right: 16),
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    50, 121, 187, 1),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: TextButton(
                                              child: const TextFrave(
                                                text: 'Aceptar',
                                                color: Colors.white,
                                                fontSize: 18,
                                                style: ('Roboto'),
                                              ),
                                              onPressed: () {
                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                        context,
                                                        'dataUser',
                                                        (route) => false);
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
            title: Text('Numero de Telefono: '),
            subtitle: Text('320 260 3789'),
            leading: Container(
              margin: EdgeInsets.only(top: 10),
              child: Icon(
                Icons.phone,
                color: Color.fromRGBO(50, 121, 187, 1),
              ),
            ),
            trailing: Container(
              margin: EdgeInsets.only(top: 18),
              child: Column(
                children: const [
                  Icon(
                    Icons.edit,
                    color: Color.fromRGBO(50, 121, 187, 1),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: AlertDialog(
                        title: TextFormField(
                          controller: _directionController,
                          autofocus: true,
                          autocorrect: true,
                          keyboardType: TextInputType.text,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val) =>
                              val!.isEmpty ? "Introduce tu direccion!" : null,
                          decoration: InputDecoration(
                              labelText: "Nueva Direccion",
                              prefixIcon: Icon(Icons.home),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                        actions: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 16, left: 16),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(50, 121, 187, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextButton(
                              child: const TextFrave(
                                text: 'Cancelar',
                                color: Colors.white,
                                fontSize: 18,
                                style: ('Roboto'),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          SizedBox(width: 60),
                          Container(
                            margin:
                                const EdgeInsets.only(bottom: 16, right: 16),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(50, 121, 187, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextButton(
                              child: const TextFrave(
                                text: 'Enviar',
                                color: Colors.white,
                                fontSize: 18,
                                style: ('Roboto'),
                              ),
                              onPressed: () {
                                print("New Direction: ${_directionController}");
                                Navigator.pop(context);
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title:
                                            Text("Se ha editado tu direccion!"),
                                        actions: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 16, right: 16),
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    50, 121, 187, 1),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: TextButton(
                                              child: const TextFrave(
                                                text: 'Aceptar',
                                                color: Colors.white,
                                                fontSize: 18,
                                                style: ('Roboto'),
                                              ),
                                              onPressed: () {
                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                        context,
                                                        'dataUser',
                                                        (route) => false);
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
            title: Text('Direccion de Residencia: '),
            subtitle: Text('Cra 00 #0-0'),
            leading: Container(
              margin: EdgeInsets.only(top: 10),
              child: Icon(
                Icons.home,
                color: Color.fromRGBO(50, 121, 187, 1),
              ),
            ),
            trailing: Container(
              margin: EdgeInsets.only(top: 18),
              child: Column(
                children: const [
                  Icon(
                    Icons.edit,
                    color: Color.fromRGBO(50, 121, 187, 1),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ListTile(
            tileColor: Color.fromRGBO(159, 199, 235, 1),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: AlertDialog(
                        title: Container(
                          child: Center(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _passwordController,
                                  autofocus: true,
                                  autocorrect: true,
                                  keyboardType: TextInputType.text,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (val) => val!.isEmpty
                                      ? "Introduce tu contraseña!"
                                      : null,
                                  decoration: InputDecoration(
                                      labelText: "Nueva Contraseña",
                                      prefixIcon: Icon(Icons.lock_outline),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16))),
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  controller: _passwordrController,
                                  autofocus: true,
                                  autocorrect: true,
                                  keyboardType: TextInputType.text,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: validatePassword,
                                  decoration: InputDecoration(
                                      labelText: "Repite tu Nueva Contraseña",
                                      prefixIcon: Icon(Icons.lock_outline),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16))),
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  controller: _passwordconfirmController,
                                  autofocus: true,
                                  autocorrect: true,
                                  keyboardType: TextInputType.text,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: validatePreviousPassword,
                                  decoration: InputDecoration(
                                      labelText: "Anterior Contraseña",
                                      prefixIcon:
                                          Icon(Icons.lock_clock_rounded),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16))),
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 16, left: 16),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(50, 121, 187, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextButton(
                              child: const TextFrave(
                                text: 'Cancelar',
                                color: Colors.white,
                                fontSize: 18,
                                style: ('Roboto'),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          SizedBox(width: 60),
                          Container(
                            margin:
                                const EdgeInsets.only(bottom: 16, right: 16),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(50, 121, 187, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextButton(
                              child: const TextFrave(
                                text: 'Enviar',
                                color: Colors.white,
                                fontSize: 18,
                                style: ('Roboto'),
                              ),
                              onPressed: () {
                                print("New Password: ${_passwordController}");
                                Navigator.pop(context);
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                            "Se ha editado tu contraseña!"),
                                        actions: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 16, right: 16),
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    50, 121, 187, 1),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: TextButton(
                                              child: const TextFrave(
                                                text: 'Aceptar',
                                                color: Colors.white,
                                                fontSize: 18,
                                                style: ('Roboto'),
                                              ),
                                              onPressed: () {
                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                        context,
                                                        'dataUser',
                                                        (route) => false);
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
            title: Center(
              child: Text('Cambiar Contraseña'),
            ),
            leading: Icon(
              Icons.lock,
              color: Color.fromRGBO(50, 121, 187, 1),
            ),
          ),
        ],
      ),
    );
  }

  String? validatePassword(String? value) {
    ("passwordr $value passsword ${_passwordController.text}");
    if (value != _passwordController.text) {
      return "Las contraseñas no coinciden";
    }
    return null;
  }

  String? validatePreviousPassword(String? value) {
    if (value != null) {
      return "Vacio!";
    }
    return null;
  }

  String? validateName(String? value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value?.length == 0) {
      return "Olvidaste el nombre!";
    } else if (!regExp.hasMatch(value!)) {
      return "El nombre debe de ser a-z y A-Z";
    }
    return null;
  }

  String? validatePhone(String? value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value?.length == 0) {
      return "Olvidaste el telefono!";
    }
    if (value?.length != 10) {
      return "El numero debe tener 10 digitos";
    } else if (!regExp.hasMatch(value!)) {
      return "Solo numeros";
    }
    return null;
  }
}
