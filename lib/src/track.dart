import 'package:modulate_vsc/src/module.dart';

class Track {
  String name;
  List<Module> modules;
  int progress;

  Track(this.name, this.modules, this.progress);

  addModule(Module newModule) {
    modules.add(newModule);
  }
}

class TrackList {
  List<Track> tracks;

  TrackList(this.tracks);

  addTrack(Track newTrack) {
    tracks.add(newTrack);
  }
}
