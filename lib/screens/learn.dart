import 'package:flutter/material.dart';

class LearnPage extends StatefulWidget {
  @override
  _LearnPageState createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  Widget _buildTrackList() {
    return new ListView.builder(
      itemBuilder: (context, index){
        if (index < _trackList.length){
          return _buildTrackInList(_trackList[index].trackName, index);
          }
        }
      }
      )
  }
  Widget buildTrackInList(String trackName, int index){
    return Card(
      child: ListTile(
        title: Text("Track 1"), //replace with function that gets track title
        subtitle: Text("3/5 modules completed"), //replace with function that calculates tasks completed
        onTap: () => _openTrack(index)
        )
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Learn Page"),
    );
  }
}
