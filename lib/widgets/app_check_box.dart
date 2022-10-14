import 'package:flutter/material.dart';
import 'package:integranic_movil_cliente/Constantes.dart';

class AppCheckBox extends StatefulWidget {
  AppCheckBox({Key? key, this.isCheck = false, required this.onPress})
      : super(key: key);
  bool isCheck;
  Function(bool) onPress;
  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox>
    with SingleTickerProviderStateMixin {
  late Animation<Color?> animation;
  late AnimationController ctrl;
  void animate() async {
    ctrl.forward();
    await Future.delayed(Duration(milliseconds: 100));
    ctrl.animateBack(0);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ctrl =
        AnimationController(duration: Duration(milliseconds: 100), vsync: this);
    animation = ColorTween(begin: kWhite, end: kGreen2).animate(ctrl)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        animate();
        widget.isCheck = !widget.isCheck;
        widget.onPress(widget.isCheck);
      },
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            color: animation.value == kWhite ? null : animation.value,
            gradient: animation.value == kWhite
                ? widget.isCheck
                    ? greenGradient()
                    : whiteGradient()
                : null,
            borderRadius: BorderRadius.circular(11),
            boxShadow: [
              BoxShadow(
                  color: kBlackApp.withOpacity(.2),
                  offset: Offset(1, 2),
                  spreadRadius: 2,
                  blurRadius: 3)
            ]),
        child: widget.isCheck
            ? Icon(
                Icons.check_rounded,
                color: kWhite,
                size: 30,
              )
            : null,
      ),
    );
  }
}
