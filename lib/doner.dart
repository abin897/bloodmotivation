class User {
  String? id;
  late String name, ph, blood, gender, age, weight, donated;
  User(
      {this.id,
        required this.name,
        required this.ph,
        required this.age,
        required this.blood,
        required this.gender,
        required this.donated,
        required this.weight});

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      "name": name,
      "ph": ph,
      "blood": blood,
      "age": age,
      "gender": gender,
      "donated": donated,
      "weight": weight
    };
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }
}