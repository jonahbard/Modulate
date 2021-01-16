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
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text("Scaffold title"),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(hintText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    setState(() {
                      _email = value.trim();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(hintText: "Password"),
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _password = value.trim();
                    });
                  },
                ),
              ),
              RaisedButton(
                child: Text("Login"),
                onPressed: () async {
                  if (_email != null || _password != null) {
                    String result =
                        await AuthService().signInWithEmail(_email, _password);
                    if (result == "success") {
                      Navigator.pushReplacement(
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
              RaisedButton(
                child: Text("Signup"),
                onPressed: () {
                  AuthService().signUpWithEmail(_email, _password);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Home()));
                },
              ),
            ],
          )),
    );
  }
}
