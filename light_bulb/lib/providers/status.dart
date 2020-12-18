class Status {
  bool on;
  int brightness;

  Status(this.on, this.brightness);

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(json['on'], json['brightness']);
  }
}