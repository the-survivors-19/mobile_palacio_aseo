import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:palacio_aseo/models/user_response.dart';
import 'package:palacio_aseo/pages/config_user.dart';
import 'package:palacio_aseo/pages/signup.dart';
import 'package:palacio_aseo/widgets/header.dart';
import 'package:palacio_aseo/widgets/logo.dart';
import 'package:palacio_aseo/widgets/text_field_custom.dart';
import 'package:palacio_aseo/widgets/widgets.dart';
import 'package:palacio_aseo/api/authentication_api.dart';

class Login extends StatefulWidget {
  const Login({key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.only(top: 0),
      physics: const BouncingScrollPhysics(),
      children: [
        Stack(
          children: [HeaderLogin(), LogoHeader()],
        ),
        _Titulo(),
        SizedBox(height: 30),
      ],
    ));
  }

  State<Login> createState() => _LoginPState();
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
            fontWeight: FontWeight.bold,
            style: ('Roboto'),
          ),
        ],
      ),
    );
  }
}

class _LoginPState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String password = '';
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    final _authenticationApi = GetIt.instance<AuthenticationApi>();

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
                      controller: _passwordController,
                      autofocus: true,
                      autocorrect: true,
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: isPasswordVisible,
                      validator: validatePassword,
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
                              text: 'Inicio',
                              color: Colors.white,
                              fontSize: 18,
                              style: ('Roboto'),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final res = await _authenticationApi.login(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                                if (res.error != null) {
                                  final message = res.error?.message ?? 'Error';
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Login'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[Text(message)],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('Aceptar'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  String token = res.data?.token ?? '';
                                  int id = res.data?.user.id ?? -1;
                                  String fullName =
                                      res.data?.user.fullName ?? '';
                                  String phone = res.data?.user.phone ?? '';
                                  String address = res.data?.user.address ?? '';
                                  String email = res.data?.user.email ?? '';
                                  String photo = res.data?.user.photo ?? '';
                                  UserResponse user = UserResponse(
                                      id: id,
                                      fullName: fullName,
                                      phone: phone,
                                      address: address,
                                      email: email,
                                      photo: photo);
                                  print("Correo: ${_emailController.text}");
                                  print(
                                      "Contraseña: ${_passwordController.text}");
                                  _formKey.currentState!.reset();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => ConfigUser(
                                          token: token, user: user)));
                                }
                              }
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String? validateEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (value?.length == 0) {
    return "Necesitas un correo electronico!";
  }
  if (!regExp.hasMatch(value!)) {
    return "Correo invalido";
  } else {
    return null;
  }
}

String? validatePassword(String? value) {
  if (value == r'nose') {
    return "Contraseña invalida";
  }
  if (value?.length == 0) {
    return "Necesitas una contraseña!";
  } else {
    return null;
  }
}
