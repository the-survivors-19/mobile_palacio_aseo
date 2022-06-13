import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:palacio_aseo/widgets/text_frave.dart';

class ConfigUser extends StatelessWidget {
  const ConfigUser({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(209, 222, 234, 1),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Image.asset('facebook.png'),
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                ),
              ),
              Column(
                children: const [
                  TextFrave(
                    text: 'BIENVENIDO!',
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 24,
                    style: ('Roboto'),
                  ),
                  SizedBox(height: 16),
                  TextFrave(
                    text: 'Freddy Castrillon',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 18,
                    style: ('Roboto'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
