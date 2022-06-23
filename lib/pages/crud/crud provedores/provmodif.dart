import 'package:palacio_aseo/pages/crud/crud%20provedores/provcrud.dart';
import 'package:flutter/material.dart';
import 'package:palacio_aseo/pages/crud/crud%20provedores/textbox.dart';

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
        children: [
          TextBox(_nameController, "Nombre"),
          TextBox(_emailController, "Email"),
          TextBox(_phoneController, "Telefono"),
          TextBox(_dutymController, "Gerente de Servicio"),
          TextBox(_addressController, "Direccion de residencia"),
          ElevatedButton(
              onPressed: () {
                String name = _nameController.text;
                String email = _emailController.text;
                String phone = _phoneController.text;
                String dutym = _dutymController.text;
                String address = _addressController.text;
                if (name.isNotEmpty &&
                    email.isNotEmpty &&
                    phone.isNotEmpty &&
                    dutym.isNotEmpty &&
                    address.isNotEmpty) {
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
              child: Text("Guardar Contacto")),
        ],
      ),
    );
  }
}
