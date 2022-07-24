import 'package:palacio_aseo/pages/crud/crud%20provedores/provcrud.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text_frave.dart';

class ModifyContact extends StatefulWidget {
  final Provider _client;
  ModifyContact(this._client);
  @override
  State<StatefulWidget> createState() => _ModifyContact();
}

class _ModifyContact extends State<ModifyContact> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dutymController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Provider c = widget._client;
    _nameController = new TextEditingController(text: c.name);
    _emailController = new TextEditingController(text: c.email);
    _phoneController = new TextEditingController(text: c.phone);
    _dutymController = new TextEditingController(text: c.dutym);
    _addressController = new TextEditingController(text: c.address);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final imgProv =
        'https://g2consultores.com.mx/wp-content/uploads/2015/11/icon-desarrollo-proveedores.png';
    return Scaffold(
      backgroundColor: Color.fromRGBO(209, 222, 234, 1),
      appBar: AppBar(
        title: TextFrave(
          text: "Modificar Provedor",
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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(6),
                  child: ClipRRect(
                    child: Image.network(
                      imgProv,
                      height: 160,
                      width: 160,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        autofocus: true,
                        autocorrect: true,
                        keyboardType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validateName,
                        decoration: InputDecoration(
                            labelText: "Nombre ",
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16))),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        autofocus: true,
                        autocorrect: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validateEmail,
                        decoration: InputDecoration(
                            labelText: "Correo Electronico ",
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16))),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _phoneController,
                        autofocus: true,
                        autocorrect: true,
                        keyboardType: TextInputType.phone,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validatePhone,
                        decoration: InputDecoration(
                            hintText: "000 000 0000",
                            labelText: "Numero de Telefono",
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16))),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _addressController,
                        autofocus: true,
                        autocorrect: true,
                        keyboardType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) =>
                            val!.isEmpty ? "Introduce tu direccion!" : null,
                        decoration: InputDecoration(
                            hintText: "Cra 00 #0-0",
                            labelText: "Direccion de residencia",
                            prefixIcon: Icon(Icons.home),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16))),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _dutymController,
                        autofocus: true,
                        autocorrect: true,
                        keyboardType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validateDuty,
                        decoration: InputDecoration(
                            labelText: "Gerente de Servicio ",
                            prefixIcon: Icon(Icons.badge_rounded),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16))),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () {
                            String name = _nameController.text;
                            String email = _emailController.text;
                            String phone = _phoneController.text;
                            String dutym = _dutymController.text;
                            String address = _addressController.text;
                            if (_formKey.currentState!.validate()) {
                              print("Correo: ${_nameController.text}");
                              _formKey.currentState!.reset();
                              Navigator.pop(
                                  context,
                                  new Provider(
                                      name: name,
                                      email: email,
                                      phone: phone,
                                      dutym: dutym,
                                      address: address));
                            }
                          },
                          child: Text("Guardar Provedor")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validateName(String? value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value?.length == 0) {
      return "Olvidaste el nombre!";
    } else if (!regExp.hasMatch(value!)) {
      return "El nombre debe de ser a-z, A-Z";
    }
    return null;
  }

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value?.length == 0) {
      return "Olvidaste el correo electronico!";
    } else if (!regExp.hasMatch(value!)) {
      return "Correo invalido";
    } else {
      return null;
    }
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

  String? validateDuty(String? value) {
    String pattern = r'(^[a-zA-Z0-9 ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value?.length == 0) {
      return "Olvidaste el nombre!";
    } else if (!regExp.hasMatch(value!)) {
      return "El nombre debe de ser a-z, A-Z o 0-9";
    }
    return null;
  }
}
