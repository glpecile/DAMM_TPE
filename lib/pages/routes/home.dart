import 'package:SerManos/pages/edit_profile.dart';
import 'package:SerManos/pages/routes/profile.dart';
import 'package:SerManos/widgets/cells/header.dart';
import 'package:SerManos/widgets/organisms/news.dart';
import 'package:SerManos/widgets/organisms/volunteerings.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/grid.dart';
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
              Profile(),
              News(),
            ],
          ))),
    );
  }
}
