import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:flutter/material.dart';

class Voluntariado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 328,
      height: 234,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: SerManosColors.neutral_0,
        boxShadow: const [
          BoxShadow(
            color: SerManosColors.neutral_75,
            blurRadius: 6,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: Column(
          children: [
            Image.asset(
              'assets/images/voluntario.jpg',
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("ACCIÓN SOCIAL",
                          style: TextStyle(
                              color: SerManosColors.neutral_75,
                              fontSize: 10,)),
                      const Text(
                        "Un Techo para mi País",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      VacantesIcons(),
                    ],
                  ),
                  gIcons()
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class gIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Icon(
          Icons.favorite_border,
          color: SerManosColors.primary_100,
          size: 24,
        ),
        Icon(
          Icons.fmd_good_rounded,
          color: SerManosColors.primary_100,
          size: 24,
        ),
      ],
    );
  }
}

class Vacantes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: SerManosColors.secondary_10,
        ),
        child: const Row(
          children: [
            Text(
              "Vacantes: ",
              style: TextStyle(fontSize: 12),
            ),
            Icon(
              Icons.person_rounded,
              color: SerManosColors.secondary_200,
              size: 20,
            ),
            Text(
              "10",
              style:
                  TextStyle(color: SerManosColors.secondary_200, fontSize: 16),
            ),
          ],
        ));
  }
}

class VacantesIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Vacantes(),
        ]);
  }
}
