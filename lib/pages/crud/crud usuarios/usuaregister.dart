import 'package:palacio_aseo/pages/crud/crud%20usuarios/usuacrud.dart';
import 'package:flutter/material.dart';
import '../../../widgets/text_frave.dart';

class RegisterUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterUser();
}

class _RegisterUser extends State<RegisterUser> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordrController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _hasMinLength(String value) {
    return value.isNotEmpty && value.length >= 8;
  }

  @override
  void initState() {
    _nameController = new TextEditingController();
    _emailController = new TextEditingController();
    _phoneController = new TextEditingController();
    _addressController = new TextEditingController();
    _passwordController = new TextEditingController();
    _passwordrController = new TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final imgUser =
        'https://static.wikia.nocookie.net/infotic/images/d/d9/Usuarios.png/revision/latest?cb=20170827062729&path-prefix=es';
    return Scaffold(
      backgroundColor: Color.fromRGBO(209, 222, 234, 1),
      appBar: AppBar(
        title: TextFrave(
          text: "Registrar Usuario",
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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                margin: EdgeInsets.all(6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.network(
                    imgUser,
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
                          labelText: "Nombre Completo ",
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
                      controller: _passwordController,
                      autofocus: true,
                      autocorrect: true,
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validatelPassword,
                      decoration: InputDecoration(
                          hintText: "********",
                          labelText: "Contraseña",
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordrController,
                      autofocus: true,
                      autocorrect: true,
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validatePassword,
                      decoration: InputDecoration(
                          hintText: "********",
                          labelText: "Confirmar Contraseña",
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          String name = _nameController.text;
                          String email = _emailController.text;
                          String phone = _phoneController.text;
                          String password = _passwordController.text;
                          String address = _addressController.text;
                          if (_formKey.currentState!.validate()) {
                            print("Correo: ${_nameController.text}");
                            _formKey.currentState!.reset();
                            Navigator.pop(
                                context,
                                new User(
                                    name: name,
                                    email: email,
                                    phone: phone,
                                    password: password,
                                    address: address));
                          }
                        },
                        child: Text("Guardar Usuario")),
                  ],
                ),
              ),
            ],
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

  String? validatelPassword(String? value) {
    if (!_hasMinLength(value!)) {
      return 'La contraseña debe tener 8 o mas digitos';
    }
    return null;
  }

  String? validatePassword(String? value) {
    ("passwordr $value passsword ${_passwordController.text}");
    if (value != _passwordController.text) {
      return "Las contraseñas no coinciden";
    }
    return null;
  }

  save() {
    if (_formKey.currentState!.validate()) {
      print("Nombre ${_nameController.text}");
      print("Telefono ${_phoneController.text}");
      print("Correo ${_emailController.text}");
      print("Direccion ${_addressController.text}");
      print("Contraseña ${_passwordController.text}");
      _formKey.currentState!.reset();
    }
  }
}
