import 'dart:developer';

import 'package:SerManos/models/contact.dart';
import 'package:SerManos/models/profile.dart';
import 'package:SerManos/providers/auth_provider.dart';
import 'package:SerManos/widgets/cells/forms/contact_data.dart';
import 'package:SerManos/widgets/cells/forms/profile_data.dart';
import 'package:SerManos/widgets/tokens/grid.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/atoms/icons.dart';
import '../../widgets/molecules/buttons/button_cta.dart';
import '../../widgets/molecules/loading_indicator.dart';
import '../../widgets/tokens/colors.dart';

class EditProfile extends ConsumerStatefulWidget {
  static String name = 'edit_profile';
  static String path = name;

  const EditProfile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<ConsumerStatefulWidget> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  bool _isFormValid = false;

  @override
  Widget build(BuildContext context) {
    var user = ref.watch(authControllerProvider);
    return user.when(data: (user){
      return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(SerManosIcons.close),
            )),
        body: SerManosGrid(
          child: ListView(
            children: [
              ProfileDataForm(
                onValidationChanged: (isValid) {
                  setState(() {
                    _isFormValid = isValid;
                  });
                },
                formKey: formKey,
              ),
              ContactDataForm(
                onValidationChanged: (isValid) {
                  setState(() {
                    _isFormValid = isValid;
                  });
                },
                formKey: formKey2,
              ),
              Flex(direction: Axis.horizontal, children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: ButtonCTA(
                        btnColor: SerManosColors.neutral_0,
                        text: "Guardar datos",
                        onPressed: () {
                          if (formKey.currentState!.validate() && formKey2.currentState!.validate()) {
                            formKey.currentState!.save();
                            formKey2.currentState!.validate();
                            formKey2.currentState!.save();
                            user?.editVolunteer(ContactData(email: user.secondaryEmail, phone: user.phone), ProfileData(gender: user.gender, dateOfBirth: user.birthDate?.toIso8601String()));
                          }
                          // log("Saving data: ${user?.secondaryEmail} ${user?.phone}");
                          // context.go('/home');
                        },
                        foregroundColor: SerManosColors.neutral_25,
                        backgroundColor: SerManosColors.primary_100,
                      ),
                    )),
              ])
            ],
          ),
        ),
      );
    }, error: (error, stackTrace) => const SizedBox.shrink(),
        loading: () => const LoadingIndicator());

  }
}
