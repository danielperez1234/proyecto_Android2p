import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:integranic_movil_cliente/Constantes.dart';

class AppTextField extends StatefulWidget {
  AppTextField(
      {Key? key,
      required this.controller,
      required this.hint,
      this.isPassword = false,
      this.width,
      this.height})
      : super(key: key);
  double? width;
  double? height;
  TextEditingController controller;
  bool isPassword;
  String hint;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isPress = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          widget.hint != ""
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    widget.hint,
                    style: textstyleregular(color: kBlackApp.withOpacity(.25)),
                  ),
                )
              : const SizedBox(),
          Container(
            width: widget.width ?? 301,
            height: widget.height ?? 50,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: kWhite,
              border: Border.all(color: kBlackApp.withOpacity(.15), width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    keyboardAppearance: Brightness.light,
                    keyboardType: widget.isPassword
                        ? TextInputType.text
                        : TextInputType.emailAddress,
                    textAlignVertical: TextAlignVertical.center,
                    style: textstyleregular(color: kBlackApp, size: 19),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 17),
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    controller: widget.controller,
                    obscureText: !isPress && widget.isPassword,
                    obscuringCharacter: '*',
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
