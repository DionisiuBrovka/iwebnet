import 'dart:async';
import 'dart:developer';

import 'package:inetweb/data/models/network_node.dart';

class NetworkCrawler {
  final int _preCrawlDelay = 200;
  final int _postCrawlDelay = 400;

  bool _isAutoCrawl = false;
  Completer<void>? _stopCompleter;

  void init() {
    log('Init', name: 'NetworkCrawler');
  }

  NetworkNode _selectNodeToProcces() {
    throw UnimplementedError();
  }

  Future<void> _proccesNode(NetworkNode node) async {
    throw UnimplementedError();
  }

  Future<void> crawl() async {
    _stopCompleter = Completer<void>();

    try {
      while (_isAutoCrawl) {
        await Future.delayed(Duration(milliseconds: _preCrawlDelay));
        final nodeToProcces = _selectNodeToProcces();
        await _proccesNode(nodeToProcces);
        await Future.delayed(Duration(milliseconds: _postCrawlDelay));
      }
    } catch (e, st) {
      log('Crawl error: $e', name: 'NetworkCrawler', stackTrace: st);
      rethrow;
    } finally {
      _stopCompleter?.complete();
    }
  }

  Future<void> dispose() async {
    log('Dispose', name: 'NetworkCrawler');
    _isAutoCrawl = false;
    await _stopCompleter?.future;
  }
}
