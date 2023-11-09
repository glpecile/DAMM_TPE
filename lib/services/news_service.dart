import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/news.dart';

class NewsService {
  final String collection = 'news';

  Future<List<News>> getNews() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(collection)
        .orderBy('createdAt', descending: true)
        .get();
    List<News> news = [];
    for (var doc in querySnapshot.docs) {
      var data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      var item = News.fromJson(data);
      news.add(item);
    }
    return news;
  }

  Future<News?> getNewsById(String newsId) async {
    var data = await FirebaseFirestore.instance
        .collection(collection)
        .doc(newsId)
        .get();
    if (data.exists) {
      var newsData = data.data() as Map<String, dynamic>;
      newsData['id'] = data.id;
      return News.fromJson(newsData);
    }
    return null;
  }
}
