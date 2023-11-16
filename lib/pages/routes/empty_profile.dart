import 'package:SerManos/models/volunteer.dart';
import 'package:SerManos/widgets/molecules/buttons/short_button.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/atoms/icons.dart';
import '../../widgets/tokens/typography.dart';

class EmptyProfile extends StatelessWidget {

  final Volunteer user;

  const EmptyProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 328,
            height: 527,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 16),
                  child: Image.asset(
                    "assets/images/profile_pic.png",
                    width: 110,
                    height: 110,
                  ),
                ),
                const SizedBox(height: 16,),
                const Text("VOLUNTARIO", style: SerManosTypography.overline(), textAlign: TextAlign.center,),
                Text("${user.name[0].toUpperCase()}${user.name.substring(1).toLowerCase()} ${user.lastName[0].toUpperCase()}${user.lastName.substring(1).toLowerCase()}", style: const SerManosTypography.subtitle_01(), textAlign: TextAlign.center,),
                const Text("¡Completá tu perfil para tener acceso a mejores oportunidades!", style: SerManosTypography.body_01(), textAlign: TextAlign.center,),
              ],
            ),
          ),
        ),
        ShortButton(btnColor: SerManosColors.neutral_0, text: "Completar", onPressed: (){}, foregroundColor: SerManosColors.neutral_10, backgroundColor: SerManosColors.primary_100, size: Size.small, icon: SerManosIcons.add)
      ],
    );
  }
}
