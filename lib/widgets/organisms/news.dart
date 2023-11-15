import 'package:SerManos/providers/news_provider.dart';
import 'package:SerManos/widgets/cells/cards/card_news.dart';
import 'package:SerManos/widgets/molecules/loading_indicator.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class News extends ConsumerWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var news = ref.watch(newsControllerProvider);

    return news.when(
        data: (newsList) {
          return Scaffold(
            backgroundColor: SerManosColors.secondary_10,
            body: RefreshIndicator(
              onRefresh: () async =>
                  await ref.refresh(newsControllerProvider.future),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      var newsItem = newsList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CardNews(
                          id: newsItem.id,
                          newsletter: newsItem.newsletter,
                          title: newsItem.title,
                          subtitle: newsItem.subtitle,
                          imageUrl: newsItem.imagePath,
                        ),
                      );
                    },
                    itemCount: newsList.length,
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  // CardVolunteers()
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) => const SizedBox.shrink(),
        loading: () => const LoadingIndicator());
  }
}
