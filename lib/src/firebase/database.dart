import "package:cloud_firestore/cloud_firestore.dart";
import 'package:modulate_vsc/src/track.dart';

class DatabaseService {
  final String uid;
  final String name;
  final String email;

  DatabaseService(this.name, this.email, this.uid);

  // collection reference
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");

  Future createUserData(List<Track> tracks) async {
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
    List<Track> tempTracks = data["tracks"];
    tempTracks.add(newTrack);
  }
}
