import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palacio_aseo/widgets/header.dart';
import 'package:palacio_aseo/widgets/logo.dart';
import 'package:palacio_aseo/pages/login.dart';
import 'package:palacio_aseo/widgets/widgets.dart';

class Signup extends StatefulWidget {
  const Signup({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.only(top: 0),
      physics: const BouncingScrollPhysics(),
      children: [
        Stack(
          children: [HeaderSignUp(), LogoHeader()],
        ),
        _Titulo(),
      ],
    ));
  }

  State<Signup> createState() => _SignupState();
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          TextButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Login())),
            child: const TextFrave(
              text: 'Iniciar Sesion',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              style: ('Roboto'),
            ),
          ),
          const TextFrave(
            text: '/',
            fontSize: 25,
            color: Colors.grey,
            style: ('Roboto'),
          ),
          TextButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Signup())),
              child: const TextFrave(
                text: 'Registrarse',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                style: ('Roboto'),
              ))
        ],
      ),
    );
  }
}

class _SignupState extends State<Signup> {
  File? image = null;
  final picker = ImagePicker();

  Future pickImg(op) async {
    var pickedFile;
    if (op == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No seleccionaste una foto');
      }
    });
    Navigator.of(context).pop();
  }

  options(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      pickImg(1);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 4, color: Colors.grey))),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFrave(
                              text: 'Tomar una foto',
                              color: Colors.grey,
                              fontSize: 18,
                              style: ('Roboto'),
                            ),
                          ),
                          Icon(
                            Icons.camera_alt,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      pickImg(2);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFrave(
                              text: 'Selecciona una foto',
                              color: Colors.grey,
                              fontSize: 18,
                              style: ('Roboto'),
                            ),
                          ),
                          Icon(
                            Icons.image,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFrave(
                              text: 'Cancelar',
                              color: Colors.grey,
                              fontSize: 18,
                              style: ('Roboto'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordrController = TextEditingController();
  TextEditingController _directionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String passwordr = '';
  bool isPasswordrVisible = true;
  String password = '';
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 0),
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            children: [HeaderSignUp(), LogoHeader()],
          ),
          _Titulo(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    const TextFrave(
                      text: 'Seleccione foto de perfil',
                      color: Colors.grey,
                      fontSize: 18,
                      style: ('Roboto'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      child: const TextFrave(
                        text: 'Subir Imagen',
                        color: Colors.white,
                        fontSize: 16,
                        style: ('Roboto'),
                      ),
                      onPressed: () {
                        options(context);
                      },
                    ),
                    const SizedBox(height: 40),
                    image != null ? Image.file(image!) : Center(),
                    const SizedBox(height: 40),
                    TextFormField(
                      controller: _nameController,
                      autofocus: true,
                      autocorrect: true,
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validateName,
                      decoration: InputDecoration(
                          hintText: "Nombres Apellidos",
                          labelText: "Nombre Completo",
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
                          hintText: "ejemplo@gmail.com",
                          labelText: "Correo Electronico",
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
                      controller: _passwordController,
                      autofocus: true,
                      autocorrect: true,
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: isPasswordVisible,
                      validator: (val) =>
                          val!.isEmpty ? "Introduce tu contraseña!" : null,
                      decoration: InputDecoration(
                          hintText: "********",
                          labelText: "Contraseña",
                          suffixIcon: IconButton(
                            icon: isPasswordVisible
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () => setState(
                                () => isPasswordVisible = !isPasswordVisible),
                          ),
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
                      obscureText: isPasswordrVisible,
                      validator: validatePassword,
                      decoration: InputDecoration(
                          hintText: "********",
                          labelText: "Confirmar Contraseña",
                          suffixIcon: IconButton(
                            icon: isPasswordrVisible
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () => setState(
                                () => isPasswordrVisible = !isPasswordrVisible),
                          ),
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _directionController,
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
                    const SizedBox(height: 40),
                    Container(
                      margin: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(50, 121, 187, 1),
                          borderRadius: BorderRadius.circular(50)),
                      child: SizedBox(
                        width: 250,
                        height: 50,
                        child: TextButton(
                            child: const TextFrave(
                              text: 'Registrarse',
                              color: Colors.white,
                              fontSize: 18,
                              style: ('Roboto'),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print("Nombre: ${_nameController.text}");
                                print("Correo: ${_emailController.text}");
                                print("Telefono: ${_phoneController.text}");
                                print(
                                    "Direccion: ${_directionController.text}");
                                print(
                                    "Contraseña: ${_passwordController.text}");
                                _formKey.currentState!.reset();
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) => Login()));
                              }
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
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
      _formKey.currentState!.reset();
    }
  }
}
