import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(color: Colors.grey, child: Text("Search")),
      Text("Based on your recent activity..."),
      Row(
        children: [Card(), Card(), Card()],
      ),
      Text("Popular Tracks"),
      Row(
        children: [Card(), Card(), Card()],
      )
    ]);
  }
}
