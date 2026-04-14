import 'package:inetweb/data/models/network_edge.dart';

abstract class NetworkEdgeRepository {
  Future<List<NetworkEdge>> getAllEdges();
  Future<void> createEdge(NetworkEdge edge);
  Future<void> upadteEdge(String uuid, NetworkEdge edge);
  Future<void> deteleEdge(String uuid);
}
