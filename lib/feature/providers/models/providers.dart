
class ServiceProviders {
  int id;
  String providerName;
  String shopName;
  String description;
  String address;
  int views;
  int status;
  int statusLabel;
  int statusCaseName;
  SubCategory subCategory;
  Media media;
  List<Tag> tags;

  ServiceProviders({
    required this.id,
    required this.providerName,
    required this.shopName,
    required this.description,
    required this.address,
    required this.views,
    required this.status,
    required this.statusLabel,
    required this.statusCaseName,
    required this.subCategory,
    required this.media,
    required this.tags,
  });

  factory ServiceProviders.fromJson(Map<String, dynamic> json) {
    return ServiceProviders(
      id: json['id'] ?? 0,
      providerName: json['provider_name'] ?? '',
      shopName: json['shop_name'] ?? '',
      description: json['description'] ?? '',
      address: json['address'] ?? '',
      views: json['views'] ?? 0,
      status: json['status'] ?? 0,
      statusLabel: json['status_label'] ?? 0,
      statusCaseName: json['status_case_name'] ?? 0,
      subCategory: SubCategory.fromJson(json['subCategory'] ?? {}),
      media: Media.fromJson(json['media'] ?? {}),
      tags: (json['tags'] as List? ?? [])
          .map((e) => Tag.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "provider_name": providerName,
    "shop_name": shopName,
    "description": description,
    "address": address,
    "views": views,
    "status": status,
    "status_label": statusLabel,
    "status_case_name": statusCaseName,
    "subCategory": subCategory.toJson(),
    "media": media.toJson(),
    "tags": tags.map((e) => e.toJson()).toList(),
  };
}
class Media {
  List<Gallery> image;
  List<Gallery> gallery;

  Media({
    required this.image,
    required this.gallery,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      image: (json['image'] as List? ?? [])
          .map((e) => Gallery.fromJson(e))
          .toList(),
      gallery: (json['gallery'] as List? ?? [])
          .map((e) => Gallery.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    "image": image.map((e) => e.toJson()).toList(),
    "gallery": gallery.map((e) => e.toJson()).toList(),
  };
}
class Gallery {
  int id;
  String name;
  String collectionName;
  String mimeType;
  String originalUrl;

  Gallery({
    required this.id,
    required this.name,
    required this.collectionName,
    required this.mimeType,
    required this.originalUrl,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) {
    return Gallery(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      collectionName: json['collection_name'] ?? '',
      mimeType: json['mime_type'] ?? '',
      originalUrl: json['original_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "collection_name": collectionName,
    "mime_type": mimeType,
    "original_url": originalUrl,
  };
}
class SubCategory {
  int id;
  String name;
  String description;
  String svgImage;

  SubCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.svgImage,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      svgImage: json['svg_image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "svg_image": svgImage,
  };
}
class Tag {
  int id;
  String name;

  Tag({
    required this.id,
    required this.name,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
