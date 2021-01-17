import "package:cloud_firestore/cloud_firestore.dart";
import 'package:modulate_vsc/src/track.dart';

class DatabaseService {
  final String uid;

  DatabaseService(this.uid);

  // collection reference
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");

  Future createUserData(
    Map<String, dynamic> info,
    String email,
  ) async {
    await users.doc(uid).set({
      "uid": uid,
      "email": email,
    });
    await users.doc(uid).collection("Tracks").doc(info["name"]).set(info);
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

  Future addTrack(Map<String, dynamic> info) async {
    await users.doc(uid).collection("Tracks").doc(info["name"]).set(info);
  }

  Future getTracks() async {
    List<String> trackNames = [];
    List<int> progress = [];
    await users.doc(uid).collection("Tracks").get().then((snapshot) => {
          snapshot.docs.forEach((doc) {
            trackNames.add(doc.id);
            progress.add(doc["progress"]);
          })
        });

    return [trackNames, progress];
  }

  Future getModules() async {}
}
