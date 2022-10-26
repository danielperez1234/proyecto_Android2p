import 'package:flutter/material.dart';
import 'package:integranic_movil_cliente/Constantes.dart';

import '../models/persona.dart';

class Detalle extends StatelessWidget {
  Detalle({Key? key, required this.persona}) : super(key: key);
  Persona persona;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Detalle",
          style: textstyleBlack(size: 25, color: kWhite),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text(
                    "Nombre",
                    style: textstyleregularItalic(size: 13, color: kGray),
                  ),
                  Text(
                    persona.nombre,
                    style: textstyleBlack(size: 30, color: kDarkBlue),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Especialidad",
                    style: textstyleregularItalic(size: 13, color: kGray),
                  ),
                  Text(
                    persona.especialidad,
                    style: textstyleregular(size: 30, color: kDarkBlue2),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Estado Civil",
                    style: textstyleregularItalic(size: 13, color: kGray),
                  ),
                  Text(
                    persona.edoCivil,
                    style: textstyleregularItalic(size: 30),
                  ),
                ],
              ),
              Column(children: [
                Text(
                  "Habilidades",
                  style: textstyleregularItalic(size: 13, color: kGray),
                ),
                ...persona.habilidades
                    .map((e) => Text(
                          e,
                          style: textstyleLight(size: 30, color: kBlue2),
                        ))
                    .toList(),
              ]),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
