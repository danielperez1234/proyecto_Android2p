import 'package:flutter/material.dart';
import 'package:integranic_movil_cliente/Constantes.dart';
import 'package:integranic_movil_cliente/widgets/app_semana.dart';

class AppSemanasCollection extends StatefulWidget {
  AppSemanasCollection({Key? key, required this.semanas}) : super(key: key);
  List<AppSemana> semanas;
  @override
  State<AppSemanasCollection> createState() => _AppSemanasCollectionState();
}

class _AppSemanasCollectionState extends State<AppSemanasCollection> {
  int actualIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                hoverColor: kRosa2,
                highlightColor: kRosa2.withOpacity(.5),
                splashColor: kBlue4shadow.withOpacity(.2),
                splashRadius: 25,
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: actualIndex > 1 ? kRosa : kGray.withOpacity(.25),
                  size: 20,
                ),
                onPressed: () {
                  if (actualIndex > 1) {
                    actualIndex -= 1;
                    setState(() {});
                  }
                },
              ),
              SizedBox(
                width: 25,
              ),
              Text("Semana $actualIndex"),
              SizedBox(
                width: 25,
              ),
              IconButton(
                  hoverColor: kRosa2,
                  highlightColor: kRosa2.withOpacity(.5),
                  splashColor: kBlue4shadow.withOpacity(.2),
                  splashRadius: 25,
                  onPressed: () {
                    if (actualIndex < widget.semanas.length) {
                      actualIndex += 1;
                      setState(() {});
                    }
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: actualIndex < widget.semanas.length
                        ? kRosa
                        : kGray.withOpacity(.25),
                    size: 20,
                  ))
            ],
          ),
          widget.semanas[actualIndex - 1]
        ],
      ),
    );
  }
}
