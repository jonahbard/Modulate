import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modulate_vsc/src/firebase/database.dart';

class LearnPage extends StatefulWidget {
  @override
  _LearnPageState createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  List<String> trackNames;
  List<int> progress;

  _LearnPageState() {
    getTracks();
  }

  getTracks() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    var result = await DatabaseService(uid).getTracks();
    if (result[0] != null) {
      trackNames = result[0];
      progress = result[1];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: trackNames != null
          ? ListView.builder(
              itemCount: trackNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(trackNames[index]),
                );
              },
            )
          : Text("No tracks"),
    );
  }
}
