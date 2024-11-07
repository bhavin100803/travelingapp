class searchmodal {
  String? from;
  String? to;
  String? starttime;
  String? endtime;
  String? price;
  String? person;
  String? duration;

  searchmodal(
      {this.from,
      this.to,
      this.starttime,
      this.endtime,
      this.price,
      this.person,this.duration});

  searchmodal.fromMap(Map<String, dynamic> map) {
    from = map["from"];
    to = map["to"];
    starttime = map["starttime"];
    endtime = map["endtime"];
    price = map["price"];
    person = map["person"];
    duration = map["duration"];
  }

  Map<String, dynamic> toMap() {
    return {
      "from": from,
      "to": to,
      "starttime": starttime,
      "endtime": endtime,
      "price": price,
      "person": person,
      "duration" : duration,
    };
  }
}

