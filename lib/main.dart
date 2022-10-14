import 'package:flutter/material.dart';
import 'package:integranic_movil_cliente/galeria/galeria_widgets.dart';
import 'package:integranic_movil_cliente/widgets/app_button.dart';
import 'package:integranic_movil_cliente/widgets/app_check_box.dart';
import 'package:integranic_movil_cliente/widgets/app_menu_button.dart';
import 'package:integranic_movil_cliente/widgets/app_text_field.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GaleriaWidgets(
        elements: {
          "Button": AppButton(
              onPress: () {
                print("work");
              },
              text: "iniciar sesión",
              appButtonStyle: AppButtonStyle.rojo()),
          "Text Usuario": AppTextField(
              controller: TextEditingController(), hint: "Correo electrónico"),
          "password": AppTextField(
            controller: TextEditingController(),
            hint: "Contraseña",
            isPassword: true,
          ),
          "CheckBox": AppCheckBox(
            onPress: (bool) {},
          ),
          "Menu Button": Column(
            children: [
              AppMenuButton(
                appMenuButtonStyle: AppMenuButtonStyle.perfil(),
              ),
              AppMenuButton(
                appMenuButtonStyle: AppMenuButtonStyle.plan(),
              ),
              AppMenuButton(
                appMenuButtonStyle: AppMenuButtonStyle.citas(),
              ),
              AppMenuButton(
                appMenuButtonStyle: AppMenuButtonStyle.chat(),
              )
            ],
          )
        },
      ),
    );
  }
}
