import 'package:flutter/material.dart';
import 'package:integranic_movil_cliente/Constantes.dart';
import 'package:integranic_movil_cliente/widgets/app_progress_bar.dart';

class AppActivityCard extends StatelessWidget {
  AppActivityCard({Key? key, required this.appActivityCardStyle})
      : super(key: key);
  AppActivityCardStyle appActivityCardStyle;
  @override
  Widget build(BuildContext context) {
    var ss = MediaQuery.of(context).size;
    return RawMaterialButton(
      onPressed: () {},
      focusElevation: 0,
      hoverColor: appActivityCardStyle.color1,
      highlightColor: appActivityCardStyle.color2.withOpacity(.1),
      splashColor: appActivityCardStyle.color2,
      focusColor: appActivityCardStyle.color1,
      fillColor: kWhite,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          width: ss.width * 9 / 10,
          height: 144,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight,
                          colors: [
                        appActivityCardStyle.color2,
                        appActivityCardStyle.color1
                      ])),
                  child: appActivityCardStyle.figure),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appActivityCardStyle.text,
                      style: textstyleregularViga(color: kBlueText, size: 17),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      appActivityCardStyle.mssg,
                      style: textstyleregular(size: 13),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    if (appActivityCardStyle.appProgressBar != null)
                      Text(
                        "Tu progreso",
                        style: textstyleregular(size: 13, color: kGray),
                      ),
                    if (appActivityCardStyle.appProgressBar != null)
                      appActivityCardStyle.appProgressBar!
                  ],
                ),
              ),
              SizedBox(
                width: 18,
              ),
              Container(
                height: 144,
                width: ss.width * 9 / 10 / 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    gradient: LinearGradient(
                        colors: [
                          appActivityCardStyle.color1,
                          appActivityCardStyle.color2
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
                child: Icon(appActivityCardStyle.icon,
                    color: kWhite, size: ss.width * 9 / 10 / 10 / 4 * 3),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppActivityCardStyle {
  Widget figure;
  IconData icon;
  String text;
  String mssg;
  Color color1;
  Color color2;
  AppProgressBar? appProgressBar;
  AppActivityCardStyle(this.color1, this.color2,
      {required this.mssg,
      required this.figure,
      required this.text,
      required this.icon,
      this.appProgressBar});

  factory AppActivityCardStyle.conexion(double porcentaje) {
    return AppActivityCardStyle(kAzulActividad, kAzulActividad2,
        mssg: "Tu forma de vida afecta tu salud de forma positiva o negativa.",
        text: "Conexión con tu cuerpo",
        figure: Container(),
        icon: Icons.arrow_forward_ios_rounded,
        appProgressBar: AppProgressBar.conexion(porcentaje));
  }
  factory AppActivityCardStyle.circadiano(double porcentaje) {
    return AppActivityCardStyle(kMoradoActividad, kMoradoActividad2,
        mssg:
            "Dale el espacio a tu cerebro durante la noche para poder recuperarse.",
        text: "Circulo circadiano",
        figure: Container(),
        icon: Icons.arrow_forward_ios_rounded,
        appProgressBar: AppProgressBar.circadiano(porcentaje));
  }
  factory AppActivityCardStyle.movimiento(double porcentaje) {
    return AppActivityCardStyle(kNaranjaActividad, kNaranjaActividad2,
        mssg: "Un cuerpo sin movimiento es energía estancada.",
        text: "Movimiento",
        figure: Container(),
        icon: Icons.arrow_forward_ios_rounded,
        appProgressBar: AppProgressBar.movimiento(porcentaje));
  }
  factory AppActivityCardStyle.ambiente(double porcentaje) {
    return AppActivityCardStyle(kVerdeActividad, kVerdeActividad2,
        mssg: "Procura que el ambiente donde vives sea lo más natural posible.",
        text: "Ambiente",
        figure: Container(),
        icon: Icons.arrow_forward_ios_rounded,
        appProgressBar: AppProgressBar.ambiente(porcentaje));
  }
  factory AppActivityCardStyle.emociones(double porcentaje) {
    return AppActivityCardStyle(kAmarilloActividad, kAmarilloActividad2,
        mssg:
            "Regula funciones involuntarias mediante el Biofeedback Training.",
        text: "Emociones",
        figure: Container(),
        icon: Icons.arrow_forward_ios_rounded,
        appProgressBar: AppProgressBar.emociones(porcentaje));
  }
  factory AppActivityCardStyle.afirmaciones(double porcentaje) {
    return AppActivityCardStyle(kAzulClActividad, kAzulCLActividad2,
        mssg:
            "Una vez a la semana siéntate con tus emociones y aplica el tapping.",
        text: "Afirmaciones",
        figure: Container(),
        icon: Icons.arrow_forward_ios_rounded,
        appProgressBar: AppProgressBar.afirmaciones(porcentaje));
  }
  factory AppActivityCardStyle.microbiota(double porcentaje) {
    return AppActivityCardStyle(kCelesteActividad, kCelesteActividad2,
        mssg: "Mejora la estabilidad de estos pequeños microrganismos.",
        text: "Microbiota",
        figure: Container(),
        icon: Icons.arrow_forward_ios_rounded,
        appProgressBar: AppProgressBar.microbiota(porcentaje));
  }
  factory AppActivityCardStyle.nutrientes(double porcentaje) {
    return AppActivityCardStyle(kAnaranjadoActividad, kAnaranjadoActividad2,
        mssg:
            "La falta de estos en nuestro cuerpo promueve problemas de salud.",
        text: "Nutrientes",
        figure: Container(),
        icon: Icons.arrow_forward_ios_rounded,
        appProgressBar: AppProgressBar.nutrientes(porcentaje));
  }
  factory AppActivityCardStyle.alimentacion(double porcentaje) {
    return AppActivityCardStyle(kRosaActividad, kRosaActividad2,
        mssg:
            "Dale a tu cuerpo las herramientas necesarias para su funcionamiento.",
        text: "Alimentacion",
        figure: Container(),
        icon: Icons.arrow_forward_ios_rounded,
        appProgressBar: AppProgressBar.alimentacion(porcentaje));
  }
}
