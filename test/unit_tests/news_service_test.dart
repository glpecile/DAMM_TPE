import 'package:SerManos/models/news.dart';
import 'package:SerManos/services/news_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NewsService', () {
    late FirebaseFirestore firestore;
    late NewsService newsService;

    setUpAll(() {
      firestore = FakeFirebaseFirestore();
      newsService = NewsService(firestore);
    });

    test('returns news list when getNews is called', () async {
      await firestore.collection('news').add({
        'title': 'Test News',
        'imagePath': 'test/image/path',
        'newsletter': 'Test Newsletter',
        'subtitle': 'Test Subtitle',
        'body': 'Test Body',
      });

      final result = await newsService.getNews();

      expect(result, isA<List<News>>());
      expect(result.first.title, 'Test News');
    });

    test('returns a news item when getNewsById is called with existing id',
        () async {
      var docRef =
          await firestore.collection('news').add({'title': 'Test News'});

      final result = await firestore.collection('news').add({
        'title': 'Test News',
        'imagePath': 'test/image/path',
        'newsletter': 'Test Newsletter',
        'subtitle': 'Test Subtitle',
        'body': 'Test Body',
      });

      final newsId = result.id;
      final news = await newsService.getNewsById(newsId);

      expect(news, isA<News>());
      expect(news?.title, 'Test News');
    });

    test('returns null when getNewsById is called with non-existing id',
        () async {
      final result = await newsService.getNewsById('non-existing-id');

      expect(result, isNull);
    });
  });
}
