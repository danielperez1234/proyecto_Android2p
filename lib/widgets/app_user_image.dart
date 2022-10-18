import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:integranic_movil_cliente/Constantes.dart';

class AppUserImage extends StatelessWidget {
  AppUserImage({Key? key, required this.porcentaje}) : super(key: key);

  ///numero con demial del [0 - 100]
  double porcentaje;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          width: 150,
          child: DashedCircularProgressBar(
            width: 150,
            height: 150,
            progress: porcentaje,
            backgroundColor: kBlackApp.withOpacity(.2),
            foregroundColor: kBlue2,
            foregroundStrokeWidth: 8,
            backgroundStrokeWidth: 8,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.network(
                  "https://i.redd.it/mphoqu32zps71.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Text(
          "${porcentaje.toStringAsFixed(0)}%",
          style: textstyleregularViga(size: 25),
        ),
        Text(
          "Tu progreso total",
          style: textstyleregular(size: 13),
        )
      ],
    );
  }
}
