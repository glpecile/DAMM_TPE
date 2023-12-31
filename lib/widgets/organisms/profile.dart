import 'package:SerManos/pages/routes/empty_profile.dart';
import 'package:SerManos/providers/auth_provider.dart';
import 'package:SerManos/widgets/cells/cards/card_information.dart';
import 'package:SerManos/widgets/molecules/buttons/button_cta.dart';
import 'package:SerManos/widgets/molecules/buttons/logout_button.dart';
import 'package:SerManos/widgets/molecules/loading_indicator.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/grid.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<ConsumerStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    var userFromProvider = ref.watch(authControllerProvider);
    var authController = ref.read(authControllerProvider.notifier);

    return userFromProvider.when(
        data: (user) {
          return SerManosGrid(
            child: ListView(children: [
              user!.hasCompletedProfile
                  ? Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 32, bottom: 16),
                        child: ClipOval(
                          child: Image.network(
                            user.imageUrl!,
                            width: 110,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Text(
                        "VOLUNTARIO",
                        style: SerManosTypography.overline(),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "${user.name[0].toUpperCase()}${user.name.substring(1).toLowerCase()} ${user.lastName[0].toUpperCase()}${user.lastName.substring(1).toLowerCase()}",
                        style: const SerManosTypography.subtitle_01(),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        user.email,
                        style: const SerManosTypography.body_01(
                            color: SerManosColors.secondary_200),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: CardInformation(
                          title: "Información personal",
                          label1: "FECHA DE NACIMIENTO",
                          content1:
                              "${user.birthDate!.day}/${user.birthDate!.month}/${user.birthDate!.year}",
                          label2: "GÉNERO",
                          content2: user.gender!.text,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32, bottom: 32),
                        child: CardInformation(
                            title: "Datos de contacto",
                            label1: "TELÉFONO",
                            content1: user.phone!,
                            label2: "E-MAIL",
                            content2: user.secondaryEmail!),
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
                      const SizedBox(
                        height: 8,
                      ),
                      LogoutButton(onLogout: () => authController.logOut()),
                      const SizedBox(
                        height: 24,
                      )
                    ])
                  : EmptyProfile(user: user),
            ]),
          );
        },
        error: (error, stackTrace) => const SizedBox.shrink(),
        loading: () => const LoadingIndicator());
  }
}
