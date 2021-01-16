import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modulate_vsc/src/firebase/database.dart';
import 'package:modulate_vsc/src/track.dart';

class LearnPage extends StatefulWidget {
  @override
  _LearnPageState createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  TrackList tracks;

  _LearnPageState() {
    getTracks();
  }

  getTracks() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    if (await DatabaseService(uid).getTracks() == null) {
      print("no values");
    } else {
      tracks = await DatabaseService(uid).getTracks();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: tracks != null
          ? ListView.builder(
              itemCount: tracks.tracks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tracks.tracks[index].name),
                );
              },
            )
          : Text("No tracks"),
    );
  }
}
