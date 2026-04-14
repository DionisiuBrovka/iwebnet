import 'package:uuid/uuid.dart';

class NetworkEdge {
  final String uuid;
  final String fromId;
  final String toId;

  NetworkEdge({required this.fromId, required this.toId, String? uuid})
    : uuid = uuid ?? Uuid().v4();

  Map<String, dynamic> toHive() {
    return {"from-id": fromId, "to-id": toId};
  }

  factory NetworkEdge.fromHive(String uuid, Map<String, dynamic> map) {
    return NetworkEdge(fromId: map['from-id'], toId: map['to-id'], uuid: uuid);
  }

  NetworkEdge copyWith({String? uuid, String? fromId, String? toId}) {
    return NetworkEdge(
      fromId: fromId ?? this.fromId,
      toId: toId ?? this.toId,
      uuid: uuid ?? this.uuid,
    );
  }
}
