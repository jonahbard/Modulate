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
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
              child: Text(
                "Based on your recent activity...",
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Card(
                    child: Container(
                        width: 150,
                        height: 150,
                        color: Colors.redAccent,
                        child: Column(
                          children: [
                            Container(
                                width: 150, height: 50, color: Colors.black),
                          ],
                        ))),
                Card(
                    child: Container(
                        width: 150, height: 150, color: Colors.blueGrey[300])),
                Card(
                    child: Container(
                        width: 150, height: 150, color: Colors.greenAccent))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              width: double.infinity,
              child: Container(
                  padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                  child: Text("Popular Tracks", textAlign: TextAlign.left))),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Card(
                    child: Container(
                        width: 150, height: 150, color: Colors.pinkAccent)),
                Card(
                    child: Container(
                        width: 150, height: 150, color: Colors.purple[300])),
                Card(
                    child: Container(
                        width: 150, height: 150, color: Colors.blueAccent))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              width: double.infinity,
              child: Container(
                  padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                  child: Text("Popular Tracks", textAlign: TextAlign.left))),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Card(
                    child: Container(
                        width: 150, height: 150, color: Colors.yellow[700])),
                Card(
                    child: Container(
                        width: 150,
                        height: 150,
                        color: Colors.deepOrange[300])),
                Card(
                    child: Container(
                        width: 150, height: 150, color: Colors.greenAccent))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              width: double.infinity,
              child: Container(
                  padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                  child: Text("Popular Tracks", textAlign: TextAlign.left))),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Card(
                    child: Container(
                        width: 150, height: 150, color: Colors.redAccent)),
                Card(
                    child: Container(
                        width: 150, height: 150, color: Colors.purple[300])),
                Card(
                    child: Container(
                        width: 150, height: 150, color: Colors.greenAccent))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
