import 'package:tredo/feature/Auth/signup/models/state.dart';

class Cities {
    final int id;
    final String name;
    final int? stateId;
    final StateModel? state;

    Cities({
        required this.id,
        required this.name,
        this.stateId,
        this.state,
    });

    factory Cities.fromJson(Map<String, dynamic> json) {
        return Cities(
            id: json['id'],
            name: json['name'],
            stateId: json['state_id'],
            state: json['state'] != null ? StateModel.fromJson(json['state']) : null,
        );
    }
}


