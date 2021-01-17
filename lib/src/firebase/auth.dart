import 'package:firebase_auth/firebase_auth.dart';
import 'package:modulate_vsc/src/firebase/database.dart';
import 'package:modulate_vsc/src/track.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in with email
  Future signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      await DatabaseService(user.uid).createUserData(
          new Track("track 1", ["Module1", "Module2"], ["content1", "content2"],
                  5)
              .getMap(),
          user.email);
      return "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "user";
      } else if (e.code == 'wrong-password') {
        return "password";
      }
    }
  }

  Future signUpWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      await DatabaseService(user.uid).createUserData(
          Track("track 1 new user", ["Module1", "Module2"],
                  ["content1", "content2"], 5)
              .getMap(),
          user.email);
    } catch (e) {
      print("something went wrong $e");
    }
  }
}
