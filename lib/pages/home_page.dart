import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(5),
      alignment: Alignment.topRight,
      child: Row(
        children: [
          const SizedBox(width: 40),
          ElevatedButton(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 10),
                Icon(Icons.access_time_rounded),
                const SizedBox(height: 8),
                Text("Categorias"),
                const SizedBox(height: 6),
              ],
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 40),
          ElevatedButton(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 10),
                Icon(Icons.access_time_rounded),
                const SizedBox(height: 8),
                Text("PQRS"),
                const SizedBox(height: 6),
              ],
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 40),
          ElevatedButton(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 10),
                Icon(Icons.access_time_rounded),
                const SizedBox(height: 8),
                Text("Nosotros"),
                const SizedBox(height: 6),
              ],
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 40),
        ],
      ),
    ));
  }
}
