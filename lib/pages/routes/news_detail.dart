import 'dart:io';

import 'package:SerManos/models/news.dart';
import 'package:SerManos/providers/news_by_id_provider.dart';
import 'package:SerManos/widgets/atoms/icons.dart';
import 'package:SerManos/widgets/molecules/buttons/expanded_button_cta.dart';
import 'package:SerManos/widgets/molecules/loading_indicator.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/grid.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class NewsDetail extends ConsumerWidget {
  static String name = 'news';
  static String path = '$name/:newsId';

  final String id;

  const NewsDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var getNewsById = ref.watch(getNewsByIdControllerProvider(newsId: id));

    void shareNews(News news) async {
      final response = await Dio().get(
        news.imagePath,
        options: Options(
          responseType: ResponseType.bytes,
        ),
      );
      final List<int> bytes = response.data;
      final Directory temp = await getTemporaryDirectory();
      final String path = '${temp.path}/image.jpg';
      final File file = File(path);
      file.writeAsBytesSync(bytes);
      await Share.shareXFiles(
        [XFile(path)],
        text: news.subtitle,
        subject: news.title,
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: SerManosColors.secondary_100,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(SerManosIcons.back, color: SerManosColors.neutral_0),
        ),
        title: const Text('Novedades',
            style: SerManosTypography.headline_01(
                color: SerManosColors.neutral_0)),
      ),
      backgroundColor: SerManosColors.secondary_10,
      body: getNewsById.when(
          data: (news) => RefreshIndicator(
              onRefresh: () =>
                  ref.refresh(getNewsByIdControllerProvider(newsId: id).future),
              child: SingleChildScrollView(
                child: SerManosGrid(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(news.newsletter,
                            style: const SerManosTypography.overline()),
                        Text(news.title,
                            style: const SerManosTypography.headline_02()),
                        const SizedBox(height: 16),
                        AspectRatio(
                            aspectRatio: 41 / 20,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(news.imagePath,
                                  fit: BoxFit.cover),
                            )),
                        const SizedBox(height: 16),
                        Text(news.subtitle,
                            style: const SerManosTypography.subtitle_01(
                                color: SerManosColors.secondary_200)),
                        const SizedBox(height: 16),
                        Text(news.body,
                            style: const SerManosTypography.body_01()),
                        const Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Text('Comparte esta noticia',
                                style: SerManosTypography.headline_02()),
                          ),
                        ),
                        ExpandedButtonCTA(
                          btnColor: SerManosColors.neutral_0,
                          text: 'Compartir',
                          foregroundColor: SerManosColors.primary_10,
                          backgroundColor: SerManosColors.primary_100,
                          onPressed: () async => shareNews(news),
                        )
                      ],
                    ),
                  ),
                ),
              )),
          error: (Object error, StackTrace stackTrace) => const SizedBox.shrink(
                child: Text('Error al cargar la noticia',
                    style: SerManosTypography.headline_02(
                        color: SerManosColors.error_100)),
              ),
          loading: () => const LoadingIndicator()),
    );
  }
}
