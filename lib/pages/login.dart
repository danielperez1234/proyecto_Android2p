import 'package:flutter/material.dart';
import 'package:integranic_movil_cliente/Constantes.dart';
import 'package:integranic_movil_cliente/controller/persona_controller.dart';
import 'package:integranic_movil_cliente/pages/lista_page.dart';
import 'package:integranic_movil_cliente/pages/registro.dart';
import 'package:integranic_movil_cliente/widgets/app_button.dart';
import 'package:integranic_movil_cliente/widgets/app_text_field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void getUsuarios() async {
    personasG = await PersonController().getPersonas();
    personas = true;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsuarios();
  }

  void Validar(BuildContext context) {
    var usr = usuariosCotroller.text;
    var pas = passwordController.text;
    if (usr == "" || pas == "") {
      var snac = SnackBar(content: Text("Debe completar todos los campos."));
      ScaffoldMessenger.of(context).showSnackBar(snac);
      return;
    } else {
      if (personasG.where((element) => element.usuario == usr).isEmpty) {
        var snac = SnackBar(content: Text("El usuario no existe"));
        ScaffoldMessenger.of(context).showSnackBar(snac);
        return;
      } else {
        if (personasG
                .where((element) => element.usuario == usr)
                .first
                .password !=
            pas) {
          var snac = SnackBar(content: Text("Contraseña no coincide"));
          ScaffoldMessenger.of(context).showSnackBar(snac);
          return;
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => ListaPage()),
              (route) => false);
        }
      }
    }
  }

  var usuariosCotroller = TextEditingController();
  var passwordController = TextEditingController();
  bool personas = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe6e6e6),
      body: Center(
        child: Container(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Login",
                style: textstyleBlack(size: 25, color: kDarkBlue),
              ),
              AppTextField(
                controller: usuariosCotroller,
                hint: "Usuario",
              ),
              AppTextField(
                controller: passwordController,
                hint: "Password",
                isPassword: true,
              ),
              AppButton(
                onPress: () {
                  if (personas) {
                    Validar(context);
                  } else {
                    var scafold = SnackBar(
                        content: Text(
                      "Cargando datos...",
                      style: TextStyle(color: Colors.white),
                    ));
                  }
                },
                text: 'Ingresar',
                appButtonStyle: AppButtonStyle.darkBlue(),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => Registro()));
                  },
                  child: Text(
                    "Registrarme",
                    style: textstyleBold(size: 25, color: kBlue),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
