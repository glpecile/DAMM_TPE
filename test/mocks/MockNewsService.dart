import 'package:SerManos/models/news.dart';
import 'package:SerManos/services/news_service.dart';

class MocksNewsService extends NewsService {
  MocksNewsService(super._firestore);
  @override
  Future<List<News>> getNews() async {
    return [
      News.fromJson({
        'id': '0',
        'imagePath': 'fakeImagePath0',
        'newsletter': 'fakeNewsletter0',
        'title': 'fakeTitle0',
        'subtitle': 'fakeSubtitle0',
        'body': 'fakeDescription0'
      }),
      News.fromJson({
        'id': '1',
        'imagePath': 'fakeImagePath1',
        'newsletter': 'fakeNewsletter1',
        'title': 'fakeTitle1',
        'subtitle': 'fakeSubtitle1',
        'body': 'fakeDescription1'
      })
    ];
  }
}
