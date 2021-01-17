import 'package:flutter/material.dart';
import 'package:modulate_vsc/screens/create_track.dart';
import 'package:modulate_vsc/screens/learn.dart';
import 'package:modulate_vsc/screens/explore.dart';
import 'package:modulate_vsc/screens/profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> _pageOptions = <Widget>[
    LearnPage(),
    ExplorePage(),
    ProfilePage()
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Learn"),
          actions: [
            Center(
              child: FlatButton(
                child: Text("New Track"),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => CreateTrack()),
                  );
                },
              ),
            )
          ],
        ),
        body: _pageOptions[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          iconSize: 20,
          backgroundColor: Colors.grey[200],
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: "Learn",
              icon: Icon(Icons.library_books),
            ),
            BottomNavigationBarItem(
              label: "Explore",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: "Profile",
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
