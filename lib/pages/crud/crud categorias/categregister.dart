import 'package:palacio_aseo/pages/crud/crud%20categorias/categcrud.dart';
import 'package:flutter/material.dart';
import '../../../widgets/text_frave.dart';

class RegisterCateg extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterCateg();
}

class _RegisterCateg extends State<RegisterCateg> {
  TextEditingController _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _descriptionController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final imgUser =
        'https://glinsa.com.mx/wp-content/uploads/2019/11/hex%C3%A1gonos_limpieza.png';
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
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(6),
                  child: ClipRRect(
                    child: Image.network(
                      imgUser,
                      height: 220,
                      width: 220,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _descriptionController,
                        autofocus: true,
                        autocorrect: true,
                        keyboardType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validateName,
                        decoration: InputDecoration(
                            labelText: "Descripcion: ",
                            prefixIcon: Icon(Icons.app_registration_sharp),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16))),
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton(
                          onPressed: () {
                            String name = _descriptionController.text;
                            if (_formKey.currentState!.validate()) {
                              print("Correo: ${_descriptionController.text}");
                              _formKey.currentState!.reset();
                              Navigator.pop(
                                  context,
                                  new Categ(
                                    description: name,
                                  ));
                            }
                          },
                          child: Text("Guardar Categoria")),
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
      return "El nombre debe de ser a-z y A-Z";
    }
    return null;
  }
}
