//Colores de la app
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

const kBlackApp = Color(0xff081528);
const kGray = Color(0xff707070);
const kWhite = Color(0xffFFFFFF);
const kBlueText = Color(0xff002DA0);
const kDarkBlue = Color(0xff0635AD);
const kDarkBlue2 = Color(0xff467AFF);
const kBlue4shadow = Color(0xff0047fe);
const kGreen = Color(0xff067163);
const kGreen2 = Color(0xff9ED64E);
//

const kBlue = Color(0xff1B97DC);
const kBlue2 = Color(0xff59C4FF);

const kRojo = Color(0xffEC4646);

///colores de menú
const kAnaranjado = Color(0xffFF984D);
const kAnaranjado2 = Color(0xffFED643);

const kRosa = Color(0xffE53683);
const kRosa2 = Color(0xffFF52DE);

const kAzul = Color(0xff5866FD);
const kAzul2 = Color(0xff589EFE);

const kVerde = Color(0xff339892);
const kVerde2 = Color(0xff2EE2BD);
PMaterialColor(Color color) {
  return MaterialColor(2, {
    50: color.withOpacity(.1),
    100: color.withOpacity(.2),
    200: color.withOpacity(.3),
    300: color.withOpacity(.4),
    400: color.withOpacity(.5),
    500: color.withOpacity(.6),
    600: color.withOpacity(.7),
    700: color.withOpacity(.8),
    800: color.withOpacity(.9),
    900: color.withOpacity(.10),
  });
}

// gradients
Gradient blueGradient({isUpDown = true}) {
  return LinearGradient(
      begin: isUpDown ? Alignment.topCenter : Alignment.bottomCenter,
      end: !isUpDown ? Alignment.topCenter : Alignment.bottomCenter,
      colors: [kBlue2, kBlue]);
}

Gradient darkBlueGradient() {
  return LinearGradient(
      colors: [kDarkBlue, kDarkBlue2],
      end: Alignment.topCenter,
      begin: Alignment.bottomCenter);
}

Gradient greenGradient({isUpDown = true}) {
  return LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      stops: [
        .05,
        1
      ],
      colors: [
        kGreen,
        kGreen2,
      ]);
}

Gradient whiteGradient({isUpDown = true}) {
  return RadialGradient(center: Alignment.bottomRight, radius: 5, stops: [
    .15,
    .65
  ], colors: [
    kWhite,
    kBlackApp,
  ]);
}

//text Styles
/// Weight 600
TextStyle textstyleButton({double size = 16, Color color = kBlackApp}) =>
    TextStyle(
        fontFamily: 'Viga',
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w600);

/// Weight 400
TextStyle textstyleregular({
  double size = 16,
  Color color = kBlackApp,
  double? letterSpacing,
}) =>
    TextStyle(
      letterSpacing: letterSpacing,
      fontFamily: 'Viga',
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w400,
    );

/// Weight 400 fontstyle italic
TextStyle textstyleregularItalic({double size = 16, Color color = kBlackApp}) =>
    TextStyle(
        fontStyle: FontStyle.italic,
        fontFamily: 'Viga',
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w400);

/// Weight 500
TextStyle textstylemedium({double size = 16, Color color = kBlackApp}) =>
    TextStyle(
        fontFamily: 'Viga',
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w500);

/// Weight 700
TextStyle textstyleBold({double size = 16, Color color = kBlackApp}) =>
    TextStyle(
        fontFamily: 'Viga',
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w700);

/// Weight 600
TextStyle textstyleSemiBold({double size = 16, Color color = kBlackApp}) =>
    TextStyle(
      fontFamily: 'Viga',
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w600,
    );
TextStyle textstyleHint({double size = 16, Color color = kBlackApp}) =>
    TextStyle(fontFamily: 'Viga', color: color, fontSize: size);

/// Weight 300
TextStyle textstyleLight({double size = 16, Color color = kBlackApp}) =>
    TextStyle(
        fontFamily: 'Viga',
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w300);
// convertidores
DateTime stringToDateDDMMAAAA(String dateString) {
  var x = dateString.split('/');
  if (x.length != 3) return DateTime(1, 1, 1);
  var date = DateTime(int.parse(x[2]), int.parse(x[1]), int.parse(x[0]));
  return date;
}

String dateToStringDDMMAAAA(DateTime date, {String splitChar = '/'}) {
  var str =
      '${date.day.toString().padLeft(2, '0')}${splitChar}${date.month.toString().padLeft(2, '0')}${splitChar}${date.year.toString()}';
  return str;
}

DateTime stringToDateAAAAMMDD(String dateString, {String splitChar = '/'}) {
  var x = dateString.split(splitChar);
  if (x.length != 3) return DateTime(1, 1, 1);
  var date = DateTime(int.parse(x[0]), int.parse(x[1]), int.parse(x[2]));
  return date;
}

String dateToStringAAAAMMDD(DateTime date, {String splitChar = '/'}) {
  var str =
      '${date.year.toString()}$splitChar${date.month.toString().padLeft(2, '0')}$splitChar${date.day.toString().padLeft(2, '0')}';
  return str;
}

String dateToStringDDMMAA(DateTime date) {
  var str =
      '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString().substring(2)}';
  return str;
}

String dateTimeToStringHHMMAMPM(DateTime date) {
  var str = DateFormat('hh:mm a').format(date);
  return str;
}

DateTime stringToDateTimeHHMMSS(String dt) {
  var aux = dt.split(":").map((e) => int.parse(e)).toList();
  DateTime newDate = DateTime(1, 1, 1, aux[0], aux[1]);
  return newDate;
}

String stringHHMMToStringHHMMSS(String time, {splitChar = ":"}) {
  var aux = time.split(splitChar);
  String ss = "00";
  if (aux.length > 2) ss = aux[2].padLeft(2, "0");
  var str = "${aux[0].padLeft(2, "0")}:${aux[1].padLeft(2, "0")}:${ss}";
  return str;
}

String stringHHMMpmamToStringHHMMSS(String time, {splitChar = ":"}) {
  var aux = time.split(splitChar);
  String ss = "00";
  if (aux[0].contains("12")) aux[0] = "00";
  int isPM = 0;
  if (aux[1].split(" ")[1].contains("p") ||
      aux[1].split(" ")[1].contains("P")) {
    isPM = 12;
  }
  if (aux.length > 2) ss = aux[2].padLeft(2, "0");
  print("sera::");
  var str =
      "${aux[0].padLeft(2, "0")}:${(int.tryParse(aux[1].split(" ")[0]) ?? 0 + isPM).toString().padLeft(2, "0")}:${ss}";
  print(str);
  return str;
}

//funciones
bool dateIsToday(DateTime dt) {
  var now = DateTime.now();
  if (dt.day == now.day) if (dt.month == now.month) if (dt.year == now.year)
    return true;
  return false;
}

extension StringExtension on String {
  ///Pone en tod un string solo la primera letra como mayuscula
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

void OpenTerminos() {
  print("terminos");
  launchURL('https://www.google.com/');
}

void OpenAviso() {
  print("aviso");
  launchURL('https://www.google.com/');
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );
  } else {
    throw 'Could not launch $url';
  }
}
