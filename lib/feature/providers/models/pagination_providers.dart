import 'package:tredo/feature/providers/models/providers.dart';

class ServiceProvidersResponse {
  List<ServiceProviders> data;
  ServiceProvidersResponse({required this.data});

  factory ServiceProvidersResponse.fromJson(Map<String, dynamic> json) {
    return ServiceProvidersResponse(
      data: (json['data'] as List? ?? [])
          .map((e) => ServiceProviders.fromJson(e))
          .toList(),
    );
  }
}
