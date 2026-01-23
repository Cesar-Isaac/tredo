class Offers {
  int id;
  String title;
  DateTime? start;
  DateTime? end;
  int status;
  String statusLabel;
  String statusCaseName;
  Media media;
  int serviceProviderId;
  ServiceProvider serviceProvider;

  Offers({
    required this.id,
    required this.title,
    this.start,
    this.end,
    required this.status,
    required this.statusLabel,
    required this.statusCaseName,
    required this.media,
    required this.serviceProviderId,
    required this.serviceProvider,
  });

  factory Offers.fromJson(Map<String, dynamic> json) => Offers(
    id: json['id'] ?? 0,
    title: json['title'] ?? '',
    start: json['start'] != null ? DateTime.tryParse(json['start']) : null,
    end: json['end'] != null ? DateTime.tryParse(json['end']) : null,
    status: json['status'] ?? 0,
    statusLabel: json['status_label']?.toString() ?? '',
    statusCaseName: json['status_case_name']?.toString() ?? '',
    media:
        json['media'] != null
            ? Media.fromJson(json['media'])
            : Media(image: []),
    serviceProviderId: json['service_provider_id'] ?? 0,
    serviceProvider:
        json['serviceProvider'] != null
            ? ServiceProvider.fromJson(json['serviceProvider'])
            : ServiceProvider(
              id: 0,
              providerName: '',
              shopName: '',
              description: '',
              address: '',
              views: 0,
              status: 0,
              statusLabel: '',
              statusCaseName: '',
            ),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'start': start?.toIso8601String(),
    'end': end?.toIso8601String(),
    'status': status,
    'status_label': statusLabel,
    'status_case_name': statusCaseName,
    'media': media.toJson(),
    'service_provider_id': serviceProviderId,
    'serviceProvider': serviceProvider.toJson(),
  };
}

class Media {
  List<ImageItem> image;

  Media({required this.image});

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    image:
        json['image'] != null
            ? List<ImageItem>.from(
              json['image'].map((x) => ImageItem.fromJson(x)),
            )
            : [],
  );

  Map<String, dynamic> toJson() => {
    'image': List<dynamic>.from(image.map((x) => x.toJson())),
  };
}

class ImageItem {
  int id;
  String name;
  String collectionName;
  String mimeType;
  String originalUrl;

  ImageItem({
    required this.id,
    required this.name,
    required this.collectionName,
    required this.mimeType,
    required this.originalUrl,
  });

  factory ImageItem.fromJson(Map<String, dynamic> json) => ImageItem(
    id: json['id'] ?? 0,
    name: json['name'] ?? '',
    collectionName: json['collection_name'] ?? '',
    mimeType: json['mime_type'] ?? '',
    originalUrl: json['original_url'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'collection_name': collectionName,
    'mime_type': mimeType,
    'original_url': originalUrl,
  };
}

class ServiceProvider {
  int id;
  String providerName;
  String shopName;
  String description;
  String address;
  int views;
  int status;
  String statusLabel;
  String statusCaseName;

  ServiceProvider({
    required this.id,
    required this.providerName,
    required this.shopName,
    required this.description,
    required this.address,
    required this.views,
    required this.status,
    required this.statusLabel,
    required this.statusCaseName,
  });

  factory ServiceProvider.fromJson(Map<String, dynamic> json) =>
      ServiceProvider(
        id: json['id'] ?? 0,
        providerName: json['provider_name'] ?? '',
        shopName: json['shop_name'] ?? '',
        description: json['description'] ?? '',
        address: json['address'] ?? '',
        views: json['views'] ?? 0,
        status: json['status'] ?? 0,
        statusLabel: json['status_label']?.toString() ?? '',
        statusCaseName: json['status_case_name']?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'provider_name': providerName,
    'shop_name': shopName,
    'description': description,
    'address': address,
    'views': views,
    'status': status,
    'status_label': statusLabel,
    'status_case_name': statusCaseName,
  };
}
