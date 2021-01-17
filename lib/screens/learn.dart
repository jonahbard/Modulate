import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modulate_vsc/screens/track_home.dart';
import 'package:modulate_vsc/src/firebase/database.dart';

class LearnPage extends StatefulWidget {
  @override
  _LearnPageState createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  bool showTracks = false;
  List<String> trackNames;
  List<int> progress;
  List<String> moduleNames;
  List<String> moduleContent;

  _LearnPageState() {
    getTracks();
  }

  Widget _buildView() {
    return showTracks
        ? ListView.builder(
            itemCount: trackNames.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(trackNames[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        var data = getData(index);
                        return TrackHome(name: trackNames[index]);
                      },
                    ),
                  );
                },
              );
            },
          )
        : Text("No tracks");
  }

  getTracks() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    var result = await DatabaseService(uid).getTracks();
    if (result[0] != null) {
      trackNames = result[0];
      progress = result[1];
      showTracks = true;
    }
  }

  getData(int index) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    var moduleResult = await DatabaseService(uid).getTrack(trackNames[index]);
    
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildView(),
    );
  }
}
