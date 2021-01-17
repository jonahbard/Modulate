import 'package:flutter/material.dart';

class ModuleHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Module Info"),
        ),
        body: RaisedButton(
          child: Text(
            "Stuff",
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
