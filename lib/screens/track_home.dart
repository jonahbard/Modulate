import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modulate_vsc/screens/module_home.dart';
import 'package:modulate_vsc/src/firebase/database.dart';

class TrackHome extends StatefulWidget {
  final String name;

  TrackHome({this.name});

  @override
  _TrackHomeState createState() => _TrackHomeState(name);
}

class _TrackHomeState extends State<TrackHome> {
  String name;
  List<dynamic> _moduleNames = [];
  List<dynamic> _moduleInfo = [];

  _TrackHomeState(String name) {
    this.name = name;
    getData();
  }

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
    return ListView.builder(
        itemCount: _moduleNames.length,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 10,
            child: ListTile(
              contentPadding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 5,
                bottom: 5,
              ),
              title: Text(_moduleNames[index]),
              subtitle: Text(_moduleInfo[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ModuleHome(
                        name: _moduleNames[index],
                        info: _moduleInfo[index],
                      );
                    },
                  ),
                );
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: size.height * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: Colors.blue,
                ),
              ),
              Column(
                children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.08,
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 40, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            width: size.width,
            height: size.height * 0.6,
            child: _buildView(),
          )
        ],
      ),
    );
  }
}
