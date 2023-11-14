import 'package:SerManos/widgets/cells/cards/card.dart';
import 'package:SerManos/widgets/cells/cards/card_news.dart';
import 'package:SerManos/widgets/cells/forms/profile_data.dart';
import 'package:SerManos/widgets/cells/header.dart';
import 'package:SerManos/widgets/molecules/inputs/search_input.dart';
import 'package:SerManos/widgets/organisms/news.dart';
import 'package:SerManos/widgets/organisms/volunteerings.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/grid.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static String name = 'home';
  static String path = '/$name';

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: SerManosColors.secondary_10,
          appBar: Header(),
          body: SerManosGrid(
              child: TabBarView(
            children: [
              Volunteerings(),
              ProfileDataForm(),
              News(),
            ],
          ))),
    );
  }
}
