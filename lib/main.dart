import 'package:flutter/material.dart';
import 'package:palacio_aseo/helpers/dependency_injection.dart';
import 'package:palacio_aseo/pages/login.dart';
import 'package:palacio_aseo/pages/splash.dart';
import 'package:palacio_aseo/widgets/navigatorbar.dart';

void main() {
  DependencyInjection.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Palacio del Aseo',
      initialRoute: "splash",
      routes: {
        "splash": (_) => SplashScreen(),
        "login": (_) => Login(),
      },
    );
  }
}
