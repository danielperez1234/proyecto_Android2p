import 'package:flutter/material.dart';
import 'package:integranic_movil_cliente/Constantes.dart';

class AppMenuButton extends StatefulWidget {
  AppMenuButton({
    Key? key,
    required this.appMenuButtonStyle,
  }) : super(key: key);
  AppMenuButtonStyle appMenuButtonStyle;
  @override
  State<AppMenuButton> createState() => _AppMenuButtonState();
}

class _AppMenuButtonState extends State<AppMenuButton> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      focusElevation: 0,
      hoverColor: widget.appMenuButtonStyle.color1,
      splashColor: widget.appMenuButtonStyle.color2,
      highlightColor: widget.appMenuButtonStyle.color2.withOpacity(.1),
      focusColor: widget.appMenuButtonStyle.color1,
      fillColor: kWhite,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Container(
        width: 167,
        height: 85,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
                colors: [Colors.transparent, kBlackApp.withOpacity(.08)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color:
                              widget.appMenuButtonStyle.color1.withOpacity(.6),
                          offset: Offset(0, 4),
                          spreadRadius: 2,
                          blurRadius: 5)
                    ],
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                        colors: [
                          widget.appMenuButtonStyle.color2,
                          widget.appMenuButtonStyle.color1
                        ]),
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  widget.appMenuButtonStyle.color2,
                                  widget.appMenuButtonStyle.color1
                                ]),
                            borderRadius: BorderRadius.circular(21)),
                        child: Center(
                          child: Icon(
                            widget.appMenuButtonStyle.icon,
                            color: kWhite,
                            size: 30,
                          ),
                        ))),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                widget.appMenuButtonStyle.text,
                style: textstyleregularViga(color: kBlueText, size: 17),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppMenuButtonStyle {
  Color color1;
  Color color2;
  String text;
  IconData icon;

  AppMenuButtonStyle(this.color1, this.color2, this.text, this.icon);

  factory AppMenuButtonStyle.perfil() {
    return AppMenuButtonStyle(
        kAnaranjado, kAnaranjado2, "Perfil", Icons.person_outline_rounded);
  }
  factory AppMenuButtonStyle.plan() {
    return AppMenuButtonStyle(kRosa, kRosa2, "Plan", Icons.list_alt);
  }
  factory AppMenuButtonStyle.citas() {
    return AppMenuButtonStyle(
        kAzul, kAzul2, "Citas", Icons.calendar_month_outlined);
  }
  factory AppMenuButtonStyle.chat() {
    return AppMenuButtonStyle(kVerde, kVerde2, "Chat", Icons.chat_outlined);
  }
}
