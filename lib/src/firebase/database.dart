import "package:cloud_firestore/cloud_firestore.dart";
import 'package:modulate_vsc/src/track.dart';

class DatabaseService {
  final String uid;

  DatabaseService(this.uid);

  // collection reference
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");

  Future createUserData(
    List<Track> tracks,
    String email,
  ) async {
    return users.doc(uid).set({
      "uid": uid,
      "email": email,
      "tracks": tracks,
    });
  }

  // true if user exists
  // false if user doesn't exist
  Future<bool> checkUser() async {
    DocumentSnapshot document = await users.doc(uid).get();
    if (document == null) {
      return false;
    } else {
      return true;
    }
  }

  Future addTrack(Track newTrack) async {
    DocumentSnapshot document = await users.doc(uid).get();
    Map<String, dynamic> data = document.data();
    var tracks = data["tracks"];
    tracks.add(newTrack);
    users.doc(uid).update({
      "tracks": tracks,
    });
  }

  Future getTracks() async {
    DocumentSnapshot document = await users.doc(uid).get();
    addTrack(Track("track 1", null, 5));
    Map<String, dynamic> data = document.data();
    print(data);
    // TrackList tempTracks = TrackList(data["tracks"]);
    // if (tempTracks.tracks.isEmpty) {
    //   return null;
    // } else {
    //   return tempTracks;
    // }
  }
}
