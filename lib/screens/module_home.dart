import 'package:flutter/material.dart';

class ModuleHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Module Info"),
        ),
        body: Column(
          children: [
            SizedBox(
              child: Text("Module INfo"),
              width: size.width,
              height: size.height*0.2,
            ),
            RaisedButton(
              child: Text(
                "Stuff",
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
