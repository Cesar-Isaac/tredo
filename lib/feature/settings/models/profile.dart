class Profile {
  late int id;
  late String firstName;
  late String lastName;
  late String phone;
  late int cityId;
  String? image;
  late City city;

  Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.cityId,
    this.image,
    required this.city,
  });

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    cityId = json['city_id'];
    image = (json['image'] == null || json['image'].toString().isEmpty)
        ? ''
        : json['image'];
    city = City.fromJson(json['city']);
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'first_name': firstName,
    'last_name': lastName,
    'phone': phone,
    'city_id': cityId,
    'image': image,
    'city': city.toJson(),
  };
}

class City {
  late int id;
  late String name;
  late int stateId;
  late State state;

  City({
    required this.id,
    required this.name,
    required this.stateId,
    required this.state,
  });

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stateId = json['state_id'];
    state = State.fromJson(json['state']);
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'state_id': stateId,
    'state': state.toJson(),
  };
}

class State {
  late int id;
  late String name;

  State({required this.id, required this.name});

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}
