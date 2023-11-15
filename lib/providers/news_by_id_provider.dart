import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/news.dart';
import '../services/news_service.dart';
part 'news_by_id_provider.g.dart';


@riverpod
Future<News> getNewsByIdController(GetNewsByIdControllerRef ref,
    {required String newsId}) async {
  final NewsService newsService = NewsService();
  var news = await newsService.getNewsById(newsId);
  return news!;
}