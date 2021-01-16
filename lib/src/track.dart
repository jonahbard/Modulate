class Track {
  String name;
  List<String> moduleNames;
  List<String> moduleContent;
  int progress;

  Track(String name, List<String> moduleNames, List<String> moduleContent,
      int progress) {
    this.name = name;
    this.moduleNames = moduleNames;
    this.moduleContent = moduleContent;
    this.progress = progress;
  }

  Map<String, dynamic> getMap() {
    return {
      "name": this.name,
      "moduleNames": this.moduleNames,
      'moduleContent': this.moduleContent,
      "progress": this.progress,
    };
  }
}
