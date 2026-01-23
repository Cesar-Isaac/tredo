class Categories {
  int id;
  String name;
  String description;
  String svgImage;

  Categories({
    required this.id,
    required this.name,
    required this.description,
    required this.svgImage,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      svgImage: json['svg_image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'svg_image': svgImage,
    };
  }
}
