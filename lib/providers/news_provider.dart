import 'package:SerManos/models/news.dart';
import 'package:SerManos/services/news_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_provider.g.dart';

@Riverpod(keepAlive: true)
class NewsController extends _$NewsController {
  final NewsService _newsService = NewsService();

  Future<List<News>> _getNews() async {
    return await _newsService.getNews();
  }

  @override
  Future<List<News>> build() async {
    return await _getNews();
  }
}
