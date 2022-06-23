import 'package:flutter/material.dart';

messageResponse(BuildContext context, String name) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text("Realizado con exito!"),
            content: Text("La categoria " + name),
          ));
}
