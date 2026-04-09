import 'package:inetweb/data/models/network_node_meta.dart';
import 'package:inetweb/data/models/node_status.dart';

class NetworkNode {
  final String uuid;
  final Uri uri;
  final NodeStatus nodeStatus;
  final NetworkNodeMeta? meta;

  NetworkNode({
    required this.uuid,
    required this.uri,
    NodeStatus? nodeStatus,
    this.meta,
  }) : nodeStatus = nodeStatus ?? .init;
}
