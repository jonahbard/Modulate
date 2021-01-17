import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modulate_vsc/src/firebase/database.dart';
import 'package:modulate_vsc/src/track.dart';

class CreateTrack extends StatefulWidget {
  @override
  _CreateTrackState createState() => _CreateTrackState();
}

class _CreateTrackState extends State<CreateTrack> {
  String _name = "name";
  List<String> _moduleNames = [];
  List<String> _moduleContents = List<String>();

  void _pushAddEditableModule() {
    String editableName = "";
    String editableContent = "";
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
          appBar: AppBar(
            title: Text('New Module'),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    _addModule(editableName, editableContent);
                    Navigator.pop(context);
                  })
            ],
          ),
          body: Column(
            children: <Widget>[
              TextField(
                  autofocus: true,
                  onChanged: (val) {
                    editableName = val;
                    //Navigator.pop(context);
                  },
                  decoration: InputDecoration(
                    hintText: "Enter module name...",
                    contentPadding: const EdgeInsets.all(16.0),
                  )),
              TextField(
                  autofocus: true,
                  onChanged: (val) {
                    editableContent = val;
                    //Navigator.pop(context);
                  },
                  decoration: InputDecoration(
                    hintText: "Enter module info...",
                    contentPadding: const EdgeInsets.all(16.0),
                  ))
            ],
          ));
    }));
  }

  Widget _buildModuleList() {
    return new ListView.builder(
        itemCount: _moduleNames.length,
        itemBuilder: (context, index) {
          if (_moduleNames == null) {
            return Text("create a module");
          } else {
            if (index < _moduleNames.length) {
              return _buildModuleInList(
                  _moduleNames[index], _moduleContents[index], index);
            } else {
              return Text("create a module");
            }
          }
        });
  }

  Widget _buildModuleInList(String name, String info, int index) {
    return Card(
        child: ListTile(
            title: Text(name), //replace with function that gets track title
            subtitle: Text(
                info), //replace with function that calculates tasks completed
            onTap: () => _pushAddEditableModule()));
  }

  void _addModule(String name, String info) {
    setState(() {
      _moduleNames.add(name);
      _moduleContents.add(info);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Track"),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.check),
              onPressed: () async {
                Track track = Track(_name, _moduleNames, _moduleContents, 0);
                String uid = FirebaseAuth.instance.currentUser.uid;
                await DatabaseService(uid).addTrack(track.getMap());
                Navigator.pop(context);
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _pushAddEditableModule,
      ),
      body: Container(
          child: Column(
        children: [
          TextField(
              onChanged: (val) {
                _name = val;
                //Navigator.pop(context);
              },
              decoration: InputDecoration(
                  hintText: "Enter Track Name...",
                  contentPadding: const EdgeInsets.all(16.0))),
          Expanded(
            child: _buildModuleList(),
          ),
        ],
      )),
    );
  }
}
