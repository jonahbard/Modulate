import "package:cloud_firestore/cloud_firestore.dart";

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

  Future getTrack(String trackName) async {
    List<String> moduleNames;
    List<int> moduleContent;
    Map<String, dynamic> data; 
    await users
        .doc(uid)
        .collection("Tracks")
        .doc(trackName)
        .get()
        .then((snapshot){
              if (snapshot.exists) {
                  data = snapshot.data();
                }
            });
  }

  Future getModules() async {}
}
