import 'package:palacio_aseo/pages/crud/crud%20categorias/categcrud.dart';
import 'package:palacio_aseo/pages/crud/crud%20categorias/textbox.dart';
import 'package:flutter/material.dart';
import '../../../widgets/text_frave.dart';

class RegisterCateg extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterCateg();
}

class _RegisterCateg extends State<RegisterCateg> {
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    _descriptionController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(209, 222, 234, 1),
        appBar: AppBar(
          title: TextFrave(
            text: "Registrar Categoria",
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
        body: ListView(
          children: [
            TextBox(_descriptionController, "Descripcion: "),
            ElevatedButton(
                onPressed: () {
                  String name = _descriptionController.text;

                  if (name.isNotEmpty) {
                    Navigator.pop(
                        context,
                        new Categ(
                          description: name,
                        ));
                  }
                },
                child: Text("Guardar Categoria")),
          ],
        ));
  }
}
