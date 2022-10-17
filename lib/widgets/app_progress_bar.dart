import 'package:flutter/material.dart';
import 'package:integranic_movil_cliente/Constantes.dart';

class AppProgressBar extends StatefulWidget {
  AppProgressBar(
      {Key? key,
      required this.width,
      required this.height,
      required this.color1,
      required this.color2,
      required this.porcentaje,
      required this.textSize})
      : super(key: key);
  factory AppProgressBar.conexion(double porcentaje) {
    return AppProgressBar(
        width: 212,
        height: 15,
        color1: kAzulActividad,
        color2: kAzulActividad2,
        porcentaje: porcentaje,
        textSize: 11);
  }
  factory AppProgressBar.circadiano(double pocentaje) {
    return AppProgressBar(
        width: 212,
        height: 15,
        color1: kMoradoActividad,
        color2: kMoradoActividad2,
        porcentaje: pocentaje,
        textSize: 11);
  }
  factory AppProgressBar.movimiento(double porcentaje) {
    return AppProgressBar(
        width: 212,
        height: 15,
        color1: kNaranjaActividad,
        color2: kNaranjaActividad2,
        porcentaje: porcentaje,
        textSize: 11);
  }
  factory AppProgressBar.ambiente(double porcentaje) {
    return AppProgressBar(
        width: 212,
        height: 15,
        color1: kVerdeActividad,
        color2: kVerdeActividad2,
        porcentaje: porcentaje,
        textSize: 11);
  }
  factory AppProgressBar.emociones(double porcentaje) {
    return AppProgressBar(
        width: 212,
        height: 15,
        color1: kAmarilloActividad,
        color2: kAmarilloActividad2,
        porcentaje: porcentaje,
        textSize: 11);
  }
  factory AppProgressBar.afirmaciones(double porcentaje) {
    return AppProgressBar(
        width: 212,
        height: 15,
        color1: kAzulClActividad,
        color2: kAzulCLActividad2,
        porcentaje: porcentaje,
        textSize: 11);
  }
  factory AppProgressBar.microbiota(double porcentaje) {
    return AppProgressBar(
        width: 212,
        height: 15,
        color1: kCelesteActividad,
        color2: kCelesteActividad2,
        porcentaje: porcentaje,
        textSize: 11);
  }
  factory AppProgressBar.nutrientes(double porcentaje) {
    return AppProgressBar(
        width: 212,
        height: 15,
        color1: kAnaranjadoActividad,
        color2: kAnaranjadoActividad2,
        porcentaje: porcentaje,
        textSize: 11);
  }
  factory AppProgressBar.alimentacion(double porcentaje) {
    return AppProgressBar(
        width: 212,
        height: 15,
        color1: kRosaActividad,
        color2: kRosaActividad2,
        porcentaje: porcentaje,
        textSize: 11);
  }

  double width;
  double height;
  double textSize;
  double porcentaje;
  Color color1;
  Color color2;

  @override
  State<AppProgressBar> createState() => _AppProgressBarState();
}

class _AppProgressBarState extends State<AppProgressBar>
    with SingleTickerProviderStateMixin {
  late Animation<Color?> an1;
  late Animation<Color?> an2;
  late AnimationController ctrl;
  @override
  void dispose() {
    // TODO: implement dispose
    ctrl.dispose();

    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ctrl = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    an1 = ColorTween(begin: widget.color1, end: widget.color2).animate(ctrl)
      ..addListener(() {
        setState(() {});
      });
    an2 = ColorTween(begin: widget.color2, end: widget.color1).animate(ctrl);
    animate();
  }

  void animate() async {
    ctrl.forward();
    await Future.delayed(ctrl.duration!);
    ctrl.reverse();
    await Future.delayed(ctrl.duration!);
    if (mounted) animate();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
              color: kWhite,
              boxShadow: [
                BoxShadow(
                    color: kBlackApp.withOpacity(.15),
                    offset: Offset(0, 2),
                    spreadRadius: 2,
                    blurRadius: 4)
              ],
              border: Border.all(color: kBlackApp.withOpacity(.2), width: 2),
              borderRadius: BorderRadius.circular(widget.height * (4 / 15))),
        ),
        Container(
          width: (widget.width / 5) +
              ((widget.width * 4 / 5) * widget.porcentaje / 100),
          height: widget.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [an1.value!, an2.value!]),
              borderRadius: BorderRadius.circular(widget.height * (4 / 15))),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.height * (4 / 15)),
            child: Row(
              children: [
                Expanded(
                    child: Center(
                  child: Text(
                    "${widget.porcentaje.toInt()}%",
                    style:
                        textstyleregular(color: kWhite, size: widget.textSize),
                  ),
                )),
                Container(
                  height: widget.height,
                  width: widget.height,
                  decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius:
                          BorderRadius.circular(widget.height * (4 / 15)),
                      border: Border.all(color: widget.color1, width: 2)),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
