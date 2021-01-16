import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Text("home screen"),
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        iconSize: 20,
        backgroundColor: Colors.grey[200],
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "Learn",
            icon: Icon(Icons.library_books),
          ),
          BottomNavigationBarItem(
              label: "Explore", icon: Icon(Icons.search)),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }
}
