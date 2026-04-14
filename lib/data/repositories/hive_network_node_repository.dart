import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:inetweb/data/utils/strings_const.dart';
import 'package:inetweb/data/models/network_node.dart';
import 'package:inetweb/domain/repositories/network_node_repository.dart';

class HiveNetworkNodeRepository extends NetworkNodeRepository {
  final _tag = "HiveNetworkNodeController";

  final _box = Hive.box(NETWORK_NODE_HIVE_BOX_NAME);

  @override
  Future<void> createNode(NetworkNode node) async {
    try {
      log('Start creating item', name: _tag);
      await _box.put(node.uuid, node.toHive());
    } catch (e, st) {
      log('Create item error', name: _tag, error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<void> deteleNode(String uuid) async {
    try {
      log('Start deleting item', name: _tag);
      _box.delete(uuid);
    } catch (e, st) {
      log('Deleting item error', name: _tag, error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<List<NetworkNode>> getAllNodes() async {
    try {
      log('Start fetching items', name: _tag);
      return _box.keys.map((key) {
        final item = _box.get(key);
        return NetworkNode.fromHive(key, item);
      }).toList();
    } catch (e, st) {
      log('Fetching items error', name: _tag, error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<void> upadteNode(String uuid, NetworkNode node) async {
    try {
      log('Start update item : $uuid', name: _tag);
      _box.put(uuid, node.toHive());
    } catch (e, st) {
      log('Update item error', name: _tag, error: e, stackTrace: st);
      rethrow;
    }
  }
}
