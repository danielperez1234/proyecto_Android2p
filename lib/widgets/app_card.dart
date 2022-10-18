import 'package:flutter/material.dart';
import 'package:integranic_movil_cliente/Constantes.dart';

class AppCard extends StatelessWidget {
  AppCard(
      {Key? key,
      required this.textHead,
      required this.textMid,
      required this.textPie,
      required this.isIncomplete})
      : super(key: key);
  String textHead;
  String textMid;
  String textPie;
  bool isIncomplete;
  @override
  Widget build(BuildContext context) {
    var ss = MediaQuery.of(context).size;
    return RawMaterialButton(
      onPressed: () {},
      focusElevation: 0,
      hoverColor: kDarkBlue,
      splashColor: kDarkBlue2,
      highlightColor: kDarkBlue2.withOpacity(.2),
      focusColor: kDarkBlue,
      fillColor: kWhite,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Stack(
          children: [
            Container(
              width: ss.width * 9 / 10,
              height: 144,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          textHead,
                          style:
                              textstyleregularViga(color: kBlueText, size: 17),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          textMid,
                          style: textstyleregular(size: 13),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          textPie,
                          style: textstyleBold(color: kDarkBlue2, size: 13),
                        )
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
                            colors: [kDarkBlue, kDarkBlue2],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter)),
                    child: Icon(Icons.arrow_forward_ios_rounded,
                        color: kWhite, size: ss.width * 9 / 10 / 10 / 4 * 3),
                  )
                ],
              ),
            ),
            if (isIncomplete)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: ss.width * 9 / 10 / 17,
                  width: ss.width * 9 / 10 / 17,
                  decoration:
                      BoxDecoration(color: kRojo, shape: BoxShape.circle),
                ),
              )
          ],
        ),
      ),
    );
  }
}
