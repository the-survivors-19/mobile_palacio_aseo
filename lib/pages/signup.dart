import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palacio_aseo/widgets/header.dart';
import 'package:palacio_aseo/widgets/logo.dart';
import 'package:palacio_aseo/widgets/text_field_custom.dart';
import 'package:palacio_aseo/pages/login.dart';
import 'package:palacio_aseo/widgets/widgets.dart';

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
        _Botton()
      ],
    ));
  }
}

class _Botton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Color.fromRGBO(50, 121, 187, 1),
          borderRadius: BorderRadius.circular(50)),
      child: TextButton(
        child: const TextFrave(
            text: 'REGISTRARSE', color: Colors.white, fontSize: 18),
        onPressed: () {},
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          TextFieldCustom(
              icono: Icons.person,
              type: TextInputType.text,
              texto: ' Nombre Completo'),
          const SizedBox(height: 20),
          TextFieldCustom(
              icono: Icons.mail_outline,
              type: TextInputType.emailAddress,
              texto: ' Correo Electronico'),
          const SizedBox(height: 20),
          TextFieldCustom(
              icono: Icons.phone,
              type: TextInputType.number,
              texto: ' Telefono'),
          const SizedBox(height: 20),
          TextFieldCustom(
              icono: Icons.visibility_off,
              type: TextInputType.text,
              pass: true,
              texto: ' Contraseña'),
          const SizedBox(height: 20),
          TextFieldCustom(
            icono: Icons.home,
            type: TextInputType.text,
            pass: true,
            texto: ' Direccion',
          ),
          const SizedBox(height: 20),
          const TextFrave(
              text: 'Seleccione una imagen', color: Colors.grey, fontSize: 18),
          const SizedBox(height: 10),
          ElevatedButton(
            child: const TextFrave(
                text: 'Subir Imagen', color: Colors.white, fontSize: 16),
            onPressed: () => pickImage(),
          ),
          const SizedBox(height: 20),
        ],
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
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Login())),
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
