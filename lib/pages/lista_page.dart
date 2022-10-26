import 'package:flutter/material.dart';
import 'package:integranic_movil_cliente/Constantes.dart';
import 'package:integranic_movil_cliente/models/persona.dart';
import 'package:integranic_movil_cliente/pages/detalle.dart';
import 'package:integranic_movil_cliente/pages/login.dart';
import 'package:integranic_movil_cliente/widgets/app_button.dart';
import 'package:integranic_movil_cliente/widgets/app_card.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({Key? key}) : super(key: key);

  @override
  State<ListaPage> createState() => _ListaPageState();
}

List<Persona> personasG = [];

class _ListaPageState extends State<ListaPage> {
  List<Persona> personas = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    personas.add(Persona(1, "Daniel", "Pérez", "123456", "Front-End", "Soltero",
        ["Java", "Flutter"]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Lista de Personas",
          style: textstyleBlack(size: 16, color: kWhite),
        ),
        titleTextStyle: textstyleBold(size: 16, color: kDarkBlue2),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: personasG
                      .map((e) => AppCard(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => Detalle(persona: e)));
                            },
                            textHead: e.nombre,
                            textMid: e.especialidad,
                            textPie: 'Click para ver',
                            isIncomplete: false,
                          ))
                      .toList(),
                ),
              ),
            ),
            AppButton(
                onPress: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                      (route) => false);
                },
                text: "LogOut",
                appButtonStyle: AppButtonStyle.rojo()),
            SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
