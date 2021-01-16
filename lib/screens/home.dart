import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Learn"),
        ),
        body: Text("home screen"),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          iconSize: 20,
          backgroundColor: Colors.grey[200],
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text("Learn"),
              icon: Icon(Icons.library_books),
            ),
            BottomNavigationBarItem(
              title: Text("Explore"),
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              title: Text("Profile"),
              icon: Icon(Icons.account_circle),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
