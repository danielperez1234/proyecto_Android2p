import 'package:flutter/material.dart';
import 'package:integranic_movil_cliente/galeria/galeria_widgets.dart';
import 'package:integranic_movil_cliente/widgets/app_activity_card.dart';
import 'package:integranic_movil_cliente/widgets/app_button.dart';
import 'package:integranic_movil_cliente/widgets/app_card.dart';
import 'package:integranic_movil_cliente/widgets/app_check_box.dart';
import 'package:integranic_movil_cliente/widgets/app_icon_config.dart';
import 'package:integranic_movil_cliente/widgets/app_menu_button.dart';
import 'package:integranic_movil_cliente/widgets/app_progress_bar.dart';
import 'package:integranic_movil_cliente/widgets/app_semana.dart';
import 'package:integranic_movil_cliente/widgets/app_semanas_collection.dart';
import 'package:integranic_movil_cliente/widgets/app_text_field.dart';
import 'package:integranic_movil_cliente/widgets/app_user_image.dart';

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
              ),
            ],
          ),
          "Progress Bar": Column(
            children: [
              AppProgressBar.conexion(0),
              AppProgressBar.circadiano(20),
              AppProgressBar.movimiento(30),
              AppProgressBar.ambiente(60),
              AppProgressBar.emociones(10),
              AppProgressBar.afirmaciones(80),
              AppProgressBar.microbiota(100),
              AppProgressBar.nutrientes(50),
              AppProgressBar.alimentacion(0),
            ],
          ),
          "Activity card": Column(
            children: [
              AppActivityCard(
                  appActivityCardStyle: AppActivityCardStyle.conexion(100)),
              AppActivityCard(
                  appActivityCardStyle: AppActivityCardStyle.circadiano(100)),
              AppActivityCard(
                  appActivityCardStyle: AppActivityCardStyle.movimiento(100)),
              AppActivityCard(
                  appActivityCardStyle: AppActivityCardStyle.ambiente(100)),
              AppActivityCard(
                  appActivityCardStyle: AppActivityCardStyle.emociones(100)),
              AppActivityCard(
                  appActivityCardStyle: AppActivityCardStyle.afirmaciones(100)),
              AppActivityCard(
                  appActivityCardStyle: AppActivityCardStyle.microbiota(100)),
              AppActivityCard(
                  appActivityCardStyle: AppActivityCardStyle.nutrientes(100)),
              AppActivityCard(
                  appActivityCardStyle: AppActivityCardStyle.alimentacion(100)),
            ],
          ),
          "AppUserImage": AppUserImage(
            porcentaje: 30,
          ),
          "settings button": AppIconConfig(),
          "Tarjeta app": AppCard(
            textHead: "Lorana Alejandra Castañeda Flores",
            textMid: "477 956 27 98 \nlorena@gmail.com",
            textPie: "Ver mis datos completos",
            isIncomplete: true,
          ),
          "Semana": AppSemana(
            semanaIndex: 3,
          ),
          "Semanas collection": AppSemanasCollection(semanas: [
            AppSemana(semanaIndex: 1),
            AppSemana(semanaIndex: 2),
            AppSemana(semanaIndex: 3),
            AppSemana(semanaIndex: 4),
            AppSemana(semanaIndex: 5),
            AppSemana(semanaIndex: 6),
            AppSemana(semanaIndex: 7),
          ])
        },
      ),
    );
  }
}
