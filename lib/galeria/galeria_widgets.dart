import 'package:flutter/material.dart';

class GaleriaWidgets extends StatefulWidget {
  GaleriaWidgets({Key? key, required this.elements}) : super(key: key);

  final String title = "widgets Show";
  Map<String, Widget> elements;
  @override
  State<GaleriaWidgets> createState() => _GaleriaWidgetsState();
}

class _GaleriaWidgetsState extends State<GaleriaWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.elements
                  .map<String, Widget>((key, value) {
                    return MapEntry(
                        key,
                        Column(children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                key,
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          value
                        ]));
                  })
                  .values
                  .toList()),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
