class Entites {
  int id;
  String name;
  String svgImage;
  List<SocialLink> socialLinks;

  Entites({
    required this.id,
    required this.name,
    required this.svgImage,
    required this.socialLinks,
  });

  factory Entites.fromJson(Map<String, dynamic> json) {
    return Entites(
      id: json['id'] as int,
      name: json['name'] as String,
      svgImage: json['svg_image'] as String,  
      socialLinks: (json['socialLinks'] as List<dynamic>?)
          ?.map((e) => SocialLink.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
    );
  }
}

class SocialLink {
  int id;
  int type;
  String typeLabel;
  String typeCaseName;
  String value;

  SocialLink({
    required this.id,
    required this.type,
    required this.typeLabel,
    required this.typeCaseName,
    required this.value,
  });

  factory SocialLink.fromJson(Map<String, dynamic> json) {
    return SocialLink(
      id: json['id'] as int,
      type: json['type'] as int,
      typeLabel: json['type_label'] as String,  
      typeCaseName: json['type_case_name'] as String,  
      value: json['value'] as String,
    );
  }
}