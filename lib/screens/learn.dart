import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modulate_vsc/screens/create_track.dart';
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
            padding: EdgeInsets.all(10),
            itemCount: trackNames.length,
            itemBuilder: (context, index) {
              return Card(
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 10,
                child: ListTile(
                  title: Text(trackNames[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TrackHome(name: trackNames[index]);
                        },
                      ),
                    );
                  },
                ),
              );
            },
          )
        : Text("No tracks");
  }

  getTracks() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    List<Object> result = await DatabaseService(uid).getTracks();
    if (result.isNotEmpty) {
      setState(() {
        trackNames = result[0];
        progress = result[1];
        showTracks = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Track"),
        clipBehavior: Clip.none,
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => CreateTrack()));
        },
      ),
      body: Center(
        child: _buildView(),
      ),
    );
  }
}
