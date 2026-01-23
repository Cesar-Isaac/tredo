class StateModel {
    int id;
    String name;

    StateModel({
        required this.id,
        required this.name,
    });

    factory StateModel.fromJson(Map<String, dynamic> json) {
        return StateModel(
            id: json['id'] as int,
            name: json['name'] as String,
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'id': id,
            'name': name,
        };
    }
}
