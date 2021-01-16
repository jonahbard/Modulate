import 'package:flutter/material.dart';
import 'package:modulate_vsc/src/module.dart';

class CreateTrack extends StatefulWidget {
  @override
  _CreateTrackState createState() => _CreateTrackState();
}

class _CreateTrackState extends State<CreateTrack> {

  List<Module> _moduleList;


  Widget _buildModuleList() {
    return new ListView.builder(
      itemBuilder: (context, index){
        if (index < _trackList.length){
          return _buildModuleInList(_moduleList[index].name, index);
        }
      }
    );
  }
  Widget buildModuleInList(String name, String info, int index){
    return Card(
      child: ListTile(
        title: Text(name), //replace with function that gets track title
        subtitle: Text("info goes here"), //replace with function that calculates tasks completed
        onTap: () => _openTrack(index)
        )
      ),
    );
  }
  void _addModule(String name, String info){
    setState(() {
      _moduleList.add(Module(name, info));
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Track"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              Navigator.pop(context);
            }
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showEditableModule,
      ),
      body: ListView.builder(

      )
    );
  }
}
