import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Container(
            child: Text(
              "Based on your recent activity...",
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Row(
          children: [
            Card(
                child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.redAccent,
                    child: Column(
                      children: [
                        Container(width: 100, height: 50, color: Colors.black),
                      ],
                    ))),
            Card(
                child: Container(
                    width: 100, height: 100, color: Colors.deepOrange[300])),
            Card(
                child: Container(
                    width: 100, height: 100, color: Colors.greenAccent))
          ],
        ),
        SizedBox(
            width: double.infinity,
            child: Container(
                child: Text("Popular Tracks", textAlign: TextAlign.left))),
        Row(
          children: [
            Card(
                child: Container(
                    width: 100, height: 100, color: Colors.redAccent)),
            Card(
                child: Container(
                    width: 100, height: 100, color: Colors.deepOrange[300])),
            Card(
                child: Container(
                    width: 100, height: 100, color: Colors.greenAccent))
          ],
        )
      ]),
    );
  }
}
