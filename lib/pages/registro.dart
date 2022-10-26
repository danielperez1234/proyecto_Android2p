import 'package:flutter/material.dart';
import 'package:integranic_movil_cliente/Constantes.dart';
import 'package:integranic_movil_cliente/models/persona.dart';
import 'package:integranic_movil_cliente/pages/lista_page.dart';
import 'package:integranic_movil_cliente/widgets/app_button.dart';
import 'package:integranic_movil_cliente/widgets/app_check_box.dart';
import 'package:integranic_movil_cliente/widgets/app_text_field.dart';
import 'package:integranic_movil_cliente/widgets/custom_dropdown.dart';

import '../controller/persona_controller.dart';

var habilidades = ["Licenciatura", "Maestria", "Doctorado"];
var estado = ["Casado", "Soltero"];

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  validacionRegistro() async {
    var usr = usuarioController.text;
    var nom = nombreController.text;
    var pas = passwordController.text;
    if (usr == "" || nom == "" || pas == "" || estadoC == "" || estudio == "") {
      var snackBar =
          SnackBar(content: Text("Debe completar todos los daos requeridos."));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else if (personasG
        .where((element) => element.usuario == usr)
        .isNotEmpty) {
      var snackBar = SnackBar(content: Text("El usuario ingresado ya existe"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else {
      List<String> h = [];
      if (java) {
        h.add("java");
      }
      if (cSharp) {
        h.add("flutter");
      }
      if (cMas) h.add("c++");
      personasG.add(Persona(personasG.length > 0 ? (personasG.last.id + 1) : 1,
          nom, usr, pas, estudio, estadoC, h));


      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ListaPage()),
          (route) => false);
    }
  }

  String selected = "";
  bool java = false;
  bool cSharp = false;
  bool cMas = false;
  String estadoC = "";
  var estudio = "";
  var usuarioController = TextEditingController();
  var nombreController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe6e6e6),
      body: Container(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "Registro",
                style: textstyleBlack(size: 32, color: kDarkBlue),
              ),
              AppTextField(controller: usuarioController, hint: "Nombre"),
              AppTextField(controller: nombreController, hint: "Usuario"),
              AppTextField(controller: passwordController, hint: "Password"),
              Container(
                  child: CustomDropDown(
                      onChanged: (s) {
                        estudio = s;
                      },
                      hintText: "Cursando:",
                      seleccionables: habilidades)),
              Text("Estado Civil"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: estado
                    .map((e) => Column(
                          children: [
                            Text(
                              e,
                              style: textstyleLight(),
                            ),
                            Radio(
                                value: e,
                                groupValue: selected,
                                onChanged: (s) {
                                  estadoC = s!.toString();
                                  selected = s.toString();
                                  setState(() {});
                                }),
                          ],
                        ))
                    .toList(),
              ),
              Text("Habilidades en:"),
              Row(
                children: [
                  AppCheckBox(onPress: (b) {
                    java = b;
                  }),
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    "Java",
                    style: textstyleregularItalic(size: 13, color: kGray),
                  )
                ],
              ),
              Row(
                children: [
                  AppCheckBox(onPress: (b) {
                    cSharp = b;
                  }),
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    "Flutter",
                    style: textstyleregularItalic(size: 13, color: kGray),
                  )
                ],
              ),
              Row(
                children: [
                  AppCheckBox(onPress: (b) {
                    cMas = b;
                  }),
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    "C++",
                    style: textstyleregularItalic(size: 13, color: kGray),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppButton(
                      onPress: () {
                        Navigator.pop(context);
                      },
                      text: "Atras",
                      appButtonStyle: AppButtonStyle.rojo()),
                  AppButton(
                      onPress: () {
                        validacionRegistro();
                      },
                      text: "Registrar",
                      appButtonStyle: AppButtonStyle.blue())
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
