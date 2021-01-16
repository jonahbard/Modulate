import 'package:flutter/material.dart';
import 'package:modulate_vsc/src/module.dart';

class CreateTrack extends StatefulWidget {
  @override
  _CreateTrackState createState() => _CreateTrackState();
}

class _CreateTrackState extends State<CreateTrack> {
  List<Module> _moduleList;
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
                  onSubmitted: (val) {
                    editableName = val;
                    //Navigator.pop(context);
                  },
                  decoration: InputDecoration(
                      hintText: "Enter module name...",
                      contentPadding: const EdgeInsets.all(16.0))),
              TextField(
                  autofocus: true,
                  onSubmitted: (val) {
                    editableContent = val;
                    //Navigator.pop(context);
                  },
                  decoration: InputDecoration(
                      hintText: "Enter module info...",
                      contentPadding: const EdgeInsets.all(16.0)))
            ],
          ));
    }));
  }

  Widget _buildModuleList() {
    return new ListView.builder(itemBuilder: (context, index) {
      if (index < _moduleList.length) {
        return _buildModuleInList(
            _moduleList[index].name, _moduleList[index].content, index);
      }
    });
  }

  Widget _buildModuleInList(String name, String info, int index) {
    return Card(
        child: ListTile(
            title: Text(name), //replace with function that gets track title
            subtitle: Text(
                "info goes here"), //replace with function that calculates tasks completed
            onTap: () => _pushAddEditableModule()));
  }

  void _addModule(String name, String info) {
    setState(() {
      _moduleList.add(Module(name, info));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create Track"),
          leading: IconButton(icon: Icon(Icons.close)),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _pushAddEditableModule,
        ),
        body: _buildModuleList());
  }
}
