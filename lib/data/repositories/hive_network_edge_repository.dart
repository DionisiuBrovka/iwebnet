import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:inetweb/data/models/network_edge.dart';
import 'package:inetweb/data/utils/strings_const.dart';
import 'package:inetweb/domain/repositories/network_edge_repository.dart';

class HiveNetworkEdgeRepository extends NetworkEdgeRepository {
  final _tag = "HiveNetworkEdgeController";

  final _box = Hive.box(NETWORK_EDGE_HIVE_BOX_NAME);

  @override
  Future<void> createEdge(NetworkEdge edge) async {
    try {
      log('Start creating item', name: _tag);
      await _box.put(edge.uuid, edge.toHive());
    } catch (e, st) {
      log('Create item error', name: _tag, error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<void> deteleEdge(String uuid) async {
    try {
      log('Start deleting item', name: _tag);
      _box.delete(uuid);
    } catch (e, st) {
      log('Deleting item error', name: _tag, error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<List<NetworkEdge>> getAllEdges() async {
    try {
      log('Start fetching items', name: _tag);
      return _box.keys.map((key) {
        final item = _box.get(key);
        return NetworkEdge.fromHive(key, item);
      }).toList();
    } catch (e, st) {
      log('Fetching items error', name: _tag, error: e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<void> upadteEdge(String uuid, NetworkEdge edge) async {
    try {
      log('Start update item : $uuid', name: _tag);
      _box.put(uuid, edge.toHive());
    } catch (e, st) {
      log('Update item error', name: _tag, error: e, stackTrace: st);
      rethrow;
    }
  }
}
