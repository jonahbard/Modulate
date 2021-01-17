import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modulate_vsc/src/firebase/database.dart';

class TrackHome extends StatefulWidget {
  String name;

  TrackHome({this.name});

  @override
  _TrackHomeState createState() => _TrackHomeState(name: name);
}

class _TrackHomeState extends State<TrackHome> {
  final String name;
  List<dynamic> _moduleNames = [];
  List<dynamic> _moduleInfo = [];

  _TrackHomeState({this.name});

  getData() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    List<Object> result = await DatabaseService(uid).getTrack(name);
    if (result.isNotEmpty) {
      setState(() {
        _moduleNames = result[0];
        _moduleInfo = result[1];
      });
    }
  }

  Widget _buildView() {
    getData();
    return ListView.builder(
        itemCount: _moduleNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_moduleNames[index]),
            subtitle: Text(_moduleInfo[index]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: _buildView(),
    );
  }
}
