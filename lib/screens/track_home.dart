import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modulate_vsc/src/firebase/database.dart';

class TrackHome extends StatelessWidget {
  final String name;
  final List<String> _moduleNames = [];
  final List<String> _moduleInfo = [];

  TrackHome({this.name});

  getData() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    var result = await DatabaseService(uid).getTrack(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
    );
  }
}
