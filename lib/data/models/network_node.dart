import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

enum NodeStatus { load, procces, proccesed }

class NetworkNode extends Equatable {
  final String uuid;
  final Uri uri;
  final NodeStatus nodeStatus;

  NetworkNode({required this.uri, String? uuid, NodeStatus? nodeStatus})
    : uuid = uuid ?? Uuid().v4(),
      nodeStatus = nodeStatus ?? .load;

  @override
  List<Object> get props => [uuid, uri, nodeStatus];

  Map<String, dynamic> toHive() {
    return {'uri': uri, 'node-status': nodeStatus};
  }

  factory NetworkNode.fromHive(String uuid, Map<String, dynamic> map) {
    return NetworkNode(
      uuid: uuid,
      uri: map['uri'],
      nodeStatus: map['nodeStatus'],
    );
  }

  NetworkNode copyWith({String? uuid, Uri? uri, NodeStatus? nodeStatus}) {
    return NetworkNode(
      uuid: uuid ?? this.uuid,
      uri: uri ?? this.uri,
      nodeStatus: nodeStatus ?? this.nodeStatus,
    );
  }
}
