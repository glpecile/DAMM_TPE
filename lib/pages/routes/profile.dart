import 'package:SerManos/widgets/molecules/buttons/button_cta.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/cells/cards/card_information.dart';


class Profile extends StatelessWidget {


  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32),
            child: CardInformation(
              title: "Información personal",
              label1: "FECHA DE NACIMIENTO",
              content1: "10/08/1990",
              label2: "GÉNERO",
              content2: "Hombre",
        ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 32),
            child: CardInformation(
                title: "Datos de contacto",
                label1: "TELÉFONO",
                content1: "+5491155764852",
                label2: "E-MAIL",
                content2: "mimail@gmail.com"),
          ),
          SizedBox(
            width: 308,
            child: ButtonCTA(
                onPressed: () => context.go('/home/edit_profile'),
                btnColor: SerManosColors.secondary_10,
                text: 'Editar perfil',
                foregroundColor: SerManosColors.primary_10,
                backgroundColor: SerManosColors.primary_100),
          ),
          SizedBox(height: 8,),
          SizedBox(
            width: 308,
            child: ButtonCTA(
              btnColor: SerManosColors.error_100,
              text: "Cerrar sesión",
              onPressed: () => {},
              foregroundColor: SerManosColors.neutral_25,
              backgroundColor: SerManosColors.neutral_0,
              ),
          )]);
  }
}