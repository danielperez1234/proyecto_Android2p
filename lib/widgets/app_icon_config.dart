import 'package:flutter/material.dart';
import 'package:integranic_movil_cliente/Constantes.dart';

class AppIconConfig extends StatelessWidget {
  const AppIconConfig({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      child: RawMaterialButton(
        onPressed: () {},
        focusElevation: 1,
        elevation: 3,
        hoverColor: kBlue4shadow.withOpacity(.2),
        splashColor: kBlue4shadow.withOpacity(.4),
        focusColor: kBlue4shadow.withOpacity(.2),
        fillColor: kWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
        child: Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              border: Border.all(color: kBlackApp.withOpacity(.2))),
          child: Icon(
            Icons.settings,
            color: kDarkBlue,
            size: 28,
          ),
        ),
      ),
    );
  }
}
