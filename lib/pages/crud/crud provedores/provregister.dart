import 'package:palacio_aseo/pages/crud/crud%20provedores/provcrud.dart';
import 'package:palacio_aseo/pages/crud/crud%20provedores/textbox.dart';
import 'package:flutter/material.dart';
import '../../../widgets/text_frave.dart';

class RegisterProvider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterContact();
}

class _RegisterContact extends State<RegisterProvider> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dutymController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    _nameController = new TextEditingController();
    _emailController = new TextEditingController();
    _phoneController = new TextEditingController();
    _dutymController = new TextEditingController();
    _addressController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(209, 222, 234, 1),
        appBar: AppBar(
          title: TextFrave(
            text: "Registrar Provedor",
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
        ));
  }
}
