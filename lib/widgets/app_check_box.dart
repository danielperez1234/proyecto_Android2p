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
  late Animation<Color?> animation2;
  late Animation<double?> animationNum;
  late Animation<double?> animationNum2;
  late AnimationController ctrl;

  void animate() async {
    if (widget.isCheck) {
      ctrl.reverse();
    } else {
      ctrl.forward();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ctrl =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);

    animation = ColorTween(begin: kWhite, end: kGreen).animate(ctrl)
      ..addListener(() {
        setState(() {});
      });
    animationNum = Tween(begin: .15, end: .05).animate(ctrl)
      ..addListener(() {
        setState(() {});
      });
    animationNum2 = Tween(begin: .65, end: .3).animate(ctrl)
      ..addListener(() {
        setState(() {});
      });

    animation2 = ColorTween(begin: kBlackApp, end: kGreen2).animate(ctrl)
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
            gradient: RadialGradient(
                center: Alignment.bottomRight,
                radius: 5,
                stops: [
                  animationNum.value!,
                  animationNum2.value!,
                ],
                colors: [
                  animation.value!,
                  animation2.value!,
                ]),
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
