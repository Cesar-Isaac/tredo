class Sliders {
  int id;
  String title;
  String image; 

  Sliders({
    required this.id,
    required this.title,
    required this.image,
  });

  factory Sliders.fromJson(Map<String, dynamic> json) {
    return Sliders(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
    };
  }
}
