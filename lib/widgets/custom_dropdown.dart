import 'package:flutter/material.dart';

import '../Constantes.dart';

class CustomDropDown extends StatefulWidget {
  CustomDropDown({
    Key? key,
    required this.hintText,
    required this.seleccionables,
    required this.onChanged,
  }) : super(key: key);
  String hintText;
  List<String> seleccionables;
  final Function(String) onChanged;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  double fontSize = 15;
  String dropdownValue = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 200,
      child: Stack(children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
                color: kWhite,
                /*  border: Border(bottom: BorderSide(color: kdarkgreen, width: 1.0)),*/
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(width: 2, color: kGray.withOpacity(.35))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Center(
            child: DropdownButton<String>(
                isExpanded: true,
                value: dropdownValue == '' ? null : dropdownValue,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: kBlackApp,
                ),
                elevation: 16,
                underline: SizedBox(),
                hint: Text(
                  widget.hintText,
                  style: textstyleregularItalic(size: fontSize, color: kGray),
                ),
                style: textstyleregular(size: fontSize),
                onChanged: (value) {
                  dropdownValue = value!;

                  widget.onChanged(value);
                  setState(() {});
                },
                items: [
                  for (var i = 0; i < widget.seleccionables.length; i++)
                    DropdownMenuItem(
                      value: widget.seleccionables[i],
                      child: Text(widget.seleccionables[i]),
                    )
                ]),
          ),
        ),
      ]),
    );
  }
}
