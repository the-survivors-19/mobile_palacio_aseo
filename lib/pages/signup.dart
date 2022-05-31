import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palacio_aseo/api/authentication_api.dart';
import 'package:palacio_aseo/widgets/header.dart';
import 'package:palacio_aseo/widgets/logo.dart';
import 'package:palacio_aseo/widgets/text_field_custom.dart';
import 'package:palacio_aseo/pages/login.dart';
import 'package:palacio_aseo/widgets/widgets.dart';

import '../widgets/navigatorbar.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

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
        _TextField(),
      ],
    ));
  }
}

class _TextField extends StatelessWidget {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      this.image = imageTemporary;
    } on PlatformException catch (e) {
      print('Error en subir la foto: $e');
    }
  }

  TextEditingController _nombreController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _telefonoController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repitpasswordController = TextEditingController();
  TextEditingController _directionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _authenticationApi = GetIt.instance<AuthenticationApi>();

    return Padding(
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
                  fontSize: 18),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const TextFrave(
                    text: 'Subir Imagen', color: Colors.white, fontSize: 16),
                onPressed: () => pickImage(),
              ),
              const SizedBox(height: 40),
              TextFormField(
                controller: _nombreController,
                autofocus: true,
                autocorrect: true,
                keyboardType: TextInputType.text,
                validator: (val) =>
                    val!.isEmpty ? "Introduce tu nombre!" : null,
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
                keyboardType: TextInputType.emailAddress,
                validator: (val) =>
                    val!.isEmpty ? "Introduce tu correo!" : null,
                decoration: InputDecoration(
                    hintText: "usuario@dominio.com",
                    labelText: "Correo Electronico",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16))),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _telefonoController,
                autofocus: true,
                autocorrect: true,
                keyboardType: TextInputType.number,
                validator: (val) =>
                    val!.isEmpty ? "Introduce tu telefono!" : null,
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
                keyboardType: TextInputType.number,
                validator: (val) =>
                    val!.isEmpty ? "Introduce tu contraseña!" : null,
                decoration: InputDecoration(
                    hintText: "********",
                    labelText: "Contraseña",
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16))),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _repitpasswordController,
                autofocus: true,
                autocorrect: true,
                keyboardType: TextInputType.number,
                validator: (val) =>
                    val!.isEmpty ? "Repite tu contraseña!" : null,
                decoration: InputDecoration(
                    hintText: "********",
                    labelText: "Confirmar Contraseña",
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16))),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _directionController,
                autofocus: true,
                autocorrect: true,
                keyboardType: TextInputType.number,
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
                          fontSize: 18),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final res = _authenticationApi.register(
                            fullName: _nombreController.text,
                            phone: _telefonoController.text,
                            address: _directionController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            passwordConfirmation: _repitpasswordController.text,
                          );
                          print(res);
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => NavBar()));
                        }
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Login()));
            },
            child: const TextFrave(
                text: 'Iniciar Sesion',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
          const TextFrave(text: '/', fontSize: 25, color: Colors.grey),
          TextButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SignUp())),
              child: const TextFrave(
                  text: 'Registrarse',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black))
        ],
      ),
    );
  }
}
