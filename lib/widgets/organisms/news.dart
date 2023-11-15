import 'package:SerManos/providers/news_provider.dart';
import 'package:SerManos/widgets/cells/cards/card_news.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class News extends ConsumerWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var news = ref.watch(newsControllerProvider);

    return Scaffold(
      backgroundColor: SerManosColors.secondary_10,
      body: Column(
        children: [
          switch (news) {
            AsyncData(:final value) => Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  var newsItem = value[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CardNews(
                      overline: newsItem.newsletter,
                      title: newsItem.title,
                      subtitle: newsItem.subtitle,
                      imageUrl: newsItem.imagePath,
                      onPressed: () {
                        context.go('/home/news');
                        // context.go('/news/${newsItem.id}');
                      },
                    ),
                  );
                },
                itemCount: value.length,
              )),
            AsyncError(:final error) => Text('Error: $error',
                style: const TextStyle(color: SerManosColors.error_100)),
            _ => const Column(children: [
                SizedBox(
                  height: 24,
                ),
                Center(
                    child: CircularProgressIndicator(
                  color: SerManosColors.primary_100,
                ))
              ]),
          },
          const SizedBox(
            height: 10,
          ),
          // CardVolunteers()
        ],
      ),
    );
  }
}
