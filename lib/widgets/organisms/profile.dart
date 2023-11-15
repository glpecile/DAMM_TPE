import 'package:SerManos/widgets/molecules/buttons/button_cta.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/grid.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/auth_provider.dart';
import '../cells/cards/card_information.dart';


class Profile extends ConsumerStatefulWidget {


  const Profile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileState();
}


class _ProfileState extends ConsumerState<ConsumerStatefulWidget>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = ref.watch(authControllerProvider).value!;
    var authController = ref.read(authControllerProvider.notifier);
    return SerManosGrid(
      child: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 16),
                child: Image.asset(
                    "assets/images/profile_pic.png",
                    width: 110,
                    height: 110,
                ),
              ),
              const Text("VOLUNTARIO", style: SerManosTypography.overline(), textAlign: TextAlign.center,),
              Text("${user.name[0].toUpperCase()}${user.name.substring(1).toLowerCase()} ${user.lastName[0].toUpperCase()}${user.lastName.substring(1).toLowerCase()}", style: const SerManosTypography.subtitle_01(), textAlign: TextAlign.center,),
              Text(user.email, style: const SerManosTypography.body_01(color: SerManosColors.secondary_200), textAlign: TextAlign.center,),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: CardInformation(
                  title: "Información personal",
                  label1: "FECHA DE NACIMIENTO",
                  content1: "${user.birthDate!.day}/${user.birthDate!.month}/${user.birthDate!.year}",
                  label2: "GÉNERO",
                  content2: "Hombre",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 32),
                child: CardInformation(
                    title: "Datos de contacto",
                    label1: "TELÉFONO",
                    content1: user.phone!,
                    label2: "E-MAIL",
                    content2: user.email),
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
              const SizedBox(height: 8,),
              SizedBox(
                width: 308,
                child: ButtonCTA(
                  btnColor: SerManosColors.error_100,
                  text: "Cerrar sesión",
                  onPressed: () => {
                    authController.logOut(),
                    context.go('/start/login')
                  },
                  foregroundColor: SerManosColors.neutral_25,
                  backgroundColor: SerManosColors.neutral_0,
                ),
              )]),]
      ),
    );
  }
}