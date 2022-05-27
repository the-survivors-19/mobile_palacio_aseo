// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:palacio_aseo/pages/home_page.dart';
import 'package:palacio_aseo/widgets/navigatorbar.dart';
import 'package:palacio_aseo/widgets/header.dart';
import 'package:palacio_aseo/widgets/logo.dart';
import 'package:palacio_aseo/widgets/text_field_custom.dart';
import 'package:palacio_aseo/pages/signup.dart';
import 'package:palacio_aseo/widgets/widgets.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.only(top: 0),
      physics: BouncingScrollPhysics(),
      children: [
        Stack(
          children: [HeaderLogin(), LogoHeader()],
        ),
        _Titulo(),
        SizedBox(height: 40),
        _EmailAndPassword(),
        _ForgotPassword(),
        SizedBox(height: 40),
        _BottonSignIn()
      ],
    ));
  }
}

class _BottonSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Color.fromRGBO(50, 121, 187, 1),
          borderRadius: BorderRadius.circular(50)),
      child: TextButton(
        child:
            const TextFrave(text: 'INICIAR', color: Colors.white, fontSize: 18),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => NavBar())),
      ),
    );
  }
}

class _ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 25, top: 20),
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextButton(
              child: const Text('¿Olvidaste tu contraseña?'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Por favor digite su correo"),
                        content: TextFieldCustom(
                            icono: Icons.mail_outline,
                            type: TextInputType.emailAddress,
                            texto: 'Correo Electronico'),
                        actions: [
                          Container(
                            margin:
                                const EdgeInsets.only(bottom: 16, right: 16),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(50, 121, 187, 1),
                                borderRadius: BorderRadius.circular(50)),
                            child: TextButton(
                              child: const TextFrave(
                                  text: 'Enviar',
                                  color: Colors.white,
                                  fontSize: 18),
                              onPressed: () {
                                Navigator.pop(context);
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                            "Se ha enviado la verificacion a su correo."),
                                        actions: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 16, right: 16),
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    50, 121, 187, 1),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: TextButton(
                                              child: const TextFrave(
                                                  text: 'Aceptar',
                                                  color: Colors.white,
                                                  fontSize: 18),
                                              onPressed: () {
                                                Navigator.pop(context);
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
                      );
                    });
              }),
        ],
      ),
    );
  }
}

class _EmailAndPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          TextFieldCustom(
              icono: Icons.mail_outline,
              type: TextInputType.emailAddress,
              texto: ' Correo Electronico'),
          const SizedBox(height: 20),
          TextFieldCustom(
              icono: Icons.visibility_off,
              type: TextInputType.text,
              pass: true,
              texto: ' Contraseña'),
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
          const TextFrave(
              text: 'Iniciar Sesion',
              fontSize: 25,
              fontWeight: FontWeight.bold),
          const TextFrave(text: ' /', fontSize: 25, color: Colors.grey),
          TextButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SignUp())),
              child: const TextFrave(
                  text: 'Registrarse',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(158, 158, 158, 1)))
        ],
      ),
    );
  }
}
