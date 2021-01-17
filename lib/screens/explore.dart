import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  Widget exploreCard(String trackName, int modules, ImageProvider image) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        color: Colors.grey[300],
        child: Column(children: [
          Container(
            width: 150,
            height: 100,
            child: Image(image: image),
            //color: Colors.blueGrey[300],
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: Colors.white,
            ),
          ),
          Container(
              width: 150,
              height: 50,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(trackName),
                    Text("$modules Modules",
                        style: TextStyle(color: Colors.grey))
                  ],
                ),
              ))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Container(
                color: Colors.transparent,
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
                  exploreCard(
                      "Introduction to AI", 35, AssetImage('assets/ai.png')),
                  exploreCard(
                      "How to spel", 17, AssetImage('assets/algebra.jpg')),
                  exploreCard(
                      "Gramar is cool", 21, AssetImage('assets/globe.jpg')),
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
                    color: Colors.transparent,
                    child: Text("Popular Tracks", textAlign: TextAlign.left))),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  exploreCard("Introduction to AI", 35,
                      AssetImage('assets/investing.jpg')),
                  exploreCard(
                      "How to spel", 17, AssetImage('assets/leadership.jpg')),
                  exploreCard("Gramar is cool", 21,
                      AssetImage('assets/linguistic_thing.jpg')),
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
                    child:
                        Text("Try something new", textAlign: TextAlign.left))),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  exploreCard("Introduction to AI", 35,
                      AssetImage('assets/writing.jpg')),
                  exploreCard(
                      "How to spel", 17, AssetImage('assets/mobiledev.png')),
                  exploreCard(
                      "Gramar is cool", 21, AssetImage('assets/money.jpg')),
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
                    child: Text("Recently added", textAlign: TextAlign.left))),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  exploreCard("Introduction to AI", 35,
                      AssetImage('assets/society.jpg')),
                  exploreCard("How to spel", 17, AssetImage('assets/usa.jpg')),
                  exploreCard(
                      "Gramar is cool", 21, AssetImage('assets/webdev.jpg')),
                ],
              ),
            )
          ]),
        ));
  }
}
