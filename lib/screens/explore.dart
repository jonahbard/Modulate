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
                      "Linear Algebra", 17, AssetImage('assets/algebra.jpg')),
                  exploreCard(
                      "Human Geography", 21, AssetImage('assets/globe.jpg')),
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
                  exploreCard("The Stock Market", 24,
                      AssetImage('assets/investing.jpg')),
                  exploreCard("Basics of Leadership", 30,
                      AssetImage('assets/leadership.jpg')),
                  exploreCard("Linguistics", 22,
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
                  exploreCard(
                      "Creative Writing", 26, AssetImage('assets/writing.jpg')),
                  exploreCard("App Development", 99999,
                      AssetImage('assets/mobiledev.png')),
                  exploreCard(
                      "How to Get Rich", 47, AssetImage('assets/money.jpg')),
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
                  exploreCard("Intro to Sociology", 31,
                      AssetImage('assets/society.jpg')),
                  exploreCard("US History", 36, AssetImage('assets/usa.jpg')),
                  exploreCard(
                      "Webs Design", 16, AssetImage('assets/webdev.jpg')),
                ],
              ),
            )
          ]),
        ));
  }
}
