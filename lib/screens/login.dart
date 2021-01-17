import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modulate_vsc/screens/home.dart';
import 'package:modulate_vsc/src/firebase/auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          //appBar: AppBar( backgroundColor: Colors.blue, title: Text("Login"), ),
          body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 70),
            Center(child: Image(image: AssetImage('assets/modulate_logo.png'))),
            Container(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                  });
                },
              ),
            ),
            SizedBox(
              width: 200,
              child: RaisedButton(
                child: Text("Log In"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () async {
                  if (_email != null || _password != null) {
                    String result =
                        await AuthService().signInWithEmail(_email, _password);
                    if (result == "success") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Home()));
                    } else {
                      print("your info was wrong $result");
                    }
                  } else {
                    print("fill out the forms");
                  }
                },
              ),
            ),
            SizedBox(
              width: 200,
              child: RaisedButton(
                child: Text("Sign Up"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {
                  AuthService().signUpWithEmail(_email, _password);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Home()));
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
