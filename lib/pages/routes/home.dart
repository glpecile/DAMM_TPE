import 'package:SerManos/widgets/cells/cards/card.dart';
import 'package:SerManos/widgets/cells/cards/card_news.dart';
import 'package:SerManos/widgets/cells/forms/profile_data.dart';
import 'package:SerManos/widgets/cells/header.dart';
import 'package:SerManos/widgets/molecules/inputs/search_input.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/grid.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
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
              Column(children: [
                SearchInput(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Voluntarios',
                  style: SerManosTypography.headline_01(),
                ),
                CardVolunteers(),
              ]),
              ProfileDataForm(),
              Column(
                children: [
                  CardNews(
                      overline: "REPORTE 2820",
                      title: "Ser donante de sangre voluntario",
                      description:
                          "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre"),
                  SizedBox(
                    height: 10,
                  ),
                  CardVolunteers()
                ],
              ),
            ],
          ))),
    );
  }
}
