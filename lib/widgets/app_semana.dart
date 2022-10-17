import 'package:flutter/material.dart';
import 'package:integranic_movil_cliente/Constantes.dart';
import 'package:integranic_movil_cliente/widgets/app_activity_card.dart';
import 'package:integranic_movil_cliente/widgets/app_progress_bar.dart';

class AppSemana extends StatelessWidget {
  AppSemana({Key? key, required this.semanaIndex}) : super(key: key);
  int semanaIndex;
  @override
  Widget build(BuildContext context) {
    var ss = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Container(
            width: ss.width * 9 / 10,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("Semana $semanaIndex | Progreso general"),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          AppProgressBar(
              width: ss.width * 9 / 10,
              height: 24,
              color1: kDarkBlue,
              color2: kDarkBlue2,
              porcentaje: 20,
              textSize: 14),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          AppActivityCard(
            appActivityCardStyle: AppActivityCardStyle.conexion(15),
          ),
          SizedBox(
            height: 15,
          ),
          AppActivityCard(
            appActivityCardStyle: AppActivityCardStyle.circadiano(30),
          ),
          SizedBox(
            height: 15,
          ),
          AppActivityCard(
            appActivityCardStyle: AppActivityCardStyle.movimiento(15),
          ),
          SizedBox(
            height: 15,
          ),
          AppActivityCard(
            appActivityCardStyle: AppActivityCardStyle.ambiente(45),
          ),
          SizedBox(
            height: 15,
          ),
          AppActivityCard(
            appActivityCardStyle: AppActivityCardStyle.emociones(60),
          ),
          SizedBox(
            height: 15,
          ),
          AppActivityCard(
            appActivityCardStyle: AppActivityCardStyle.afirmaciones(31),
          ),
          SizedBox(
            height: 15,
          ),
          AppActivityCard(
            appActivityCardStyle: AppActivityCardStyle.microbiota(90),
          ),
          SizedBox(
            height: 15,
          ),
          AppActivityCard(
            appActivityCardStyle: AppActivityCardStyle.nutrientes(70),
          ),
          SizedBox(
            height: 15,
          ),
          AppActivityCard(
            appActivityCardStyle: AppActivityCardStyle.alimentacion(0),
          ),
        ],
      ),
    );
  }
}
