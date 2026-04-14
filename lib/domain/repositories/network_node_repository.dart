import 'package:inetweb/data/models/network_node.dart';

abstract class NetworkNodeRepository {
  Future<List<NetworkNode>> getAllNodes();
  Future<void> createNode(NetworkNode node);
  Future<void> upadteNode(String uuid, NetworkNode node);
  Future<void> deteleNode(String uuid);
}
