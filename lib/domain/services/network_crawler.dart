import 'dart:async';
import 'dart:developer';

class NetworkCrawler {
  final int _preCrawlDelay = 200;
  final int _postCrawlDelay = 1000;

  bool _isAutoCrawl = false;
  Completer<void>? _stopCompleter;

  void init() {
    log('Init', name: 'NetworkCrawler');
  }

  Future<void> _proccesNode() async {
    throw UnimplementedError();
  }

  Future<void> crawl() async {
    _stopCompleter = Completer<void>();

    try {
      while (_isAutoCrawl) {
        await Future.delayed(Duration(milliseconds: _preCrawlDelay));
        await _proccesNode();
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
