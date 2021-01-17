import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            child: Image(image: AssetImage('assets/pink_profile_masked.png')),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("John Smith"),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Modulator since Jan 15, 2021"),
            ),
          ),
          Row(
            children: [
              Container(),
              Container(),
            ],
          )
        ],
      ),
    );
  }
}
