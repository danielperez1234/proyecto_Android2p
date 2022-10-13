import 'package:flutter/material.dart';
import 'package:integranic_movil_cliente/Constantes.dart';

class AppButton extends StatelessWidget {
  AppButton(
      {Key? key,
      required this.onPress,
      required this.text,
      required this.appButtonStyle})
      : super(key: key);
  AppButtonStyle appButtonStyle;
  Function() onPress;
  String text;
  @override
  Widget build(BuildContext context) {
    var ss = MediaQuery.of(context).size;
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(27), boxShadow: [
        BoxShadow(
          color: kBlue4shadow.withOpacity(.25),
          offset: Offset(0, 8),
          spreadRadius: 2,
          blurRadius: 15,
        )
      ]),
      child: RawMaterialButton(
        onPressed: () {
          onPress();
        },
        elevation: 0,
        hoverColor: appButtonStyle.color2,
        splashColor: appButtonStyle.color1.withOpacity(.5),
        highlightColor: appButtonStyle.color2.withOpacity(.3),
        padding: EdgeInsets.all(2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(27)),
        child: Container(
          width: ss.width / 2,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: appButtonStyle.gradient),
          child: Center(
            child: Text(
              text.toUpperCase(),
              style: textstyleregular(
                  color: appButtonStyle.textColor, size: 17, letterSpacing: 2),
            ),
          ),
        ),
      ),
    );
  }
}

class AppButtonStyle {
  Gradient gradient;
  Color textColor;
  Color color1;
  Color color2;

  AppButtonStyle(this.gradient, this.textColor, this.color1, this.color2);

  factory AppButtonStyle.darkBlue() {
    return AppButtonStyle(darkBlueGradient(), kWhite, kDarkBlue, kDarkBlue2);
  }
  factory AppButtonStyle.blue() {
    return AppButtonStyle(blueGradient(), kWhite, kBlue, kBlue2);
  }
  factory AppButtonStyle.rojo() {
    return AppButtonStyle(
        LinearGradient(colors: [kRojo, kRojo]), kWhite, kRojo, kRojo);
  }
}
