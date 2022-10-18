import 'package:flutter/material.dart';
import 'package:integranic_movil_cliente/Constantes.dart';
import 'package:intl/intl.dart';

class AppNota extends StatelessWidget {
  AppNota({Key? key, required this.text, required this.fechaEscrito})
      : super(key: key);
  DateTime fechaEscrito;
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(
          "${fechaEscrito.day} de ${DateFormat('MMMM', 'es').format(fechaEscrito)}, ${fechaEscrito.year} | ${DateFormat('hh:mm').format(fechaEscrito)} h",
          style: textstyleregularViga(
            size: 21,
          ),
        ),
        Text(
          text,
          style: textstyleregular(size: 17),
        )
      ]),
    );
  }
}
