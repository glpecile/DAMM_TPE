import 'package:SerManos/models/news.dart';
import 'package:SerManos/services/news_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_provider.g.dart';

@riverpod
class NewsController extends _$NewsController {
  final NewsService _newsService = NewsService();

  Future<List<News>> getNews() async {
    return await _newsService.getNews();
  }

  getNewsById(String newsId) async {
    var news = await _newsService.getNewsById(newsId);
    return news;
  }

  @override
  FutureOr<List<News>> build() async {
    return getNews();
  }
}
