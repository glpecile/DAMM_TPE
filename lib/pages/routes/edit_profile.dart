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
  final GlobalKey<FormState> personalInfoFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> contactInfoFormKey = GlobalKey<FormState>();
  ContactData contactData = ContactData(email: "", phone: "");
  ProfileData profileData = ProfileData();

  bool _isFormValid = false;

  @override
  Widget build(BuildContext context) {
    var user = ref.watch(authControllerProvider);
    return user.when(
        data: (user) {
          contactData = ContactData(
              email: user?.secondaryEmail ?? "", phone: user?.phone ?? "");
          profileData = ProfileData(
              dateOfBirth: user?.getBirthDate ?? "",
              gender: user?.gender,
              imageUrl: user?.imageUrl);

          setState(
            () => _isFormValid = user?.hasCompletedProfile ?? false,
          );

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
                      setState(() => _isFormValid = isValid);
                    },
                    formKey: personalInfoFormKey,
                    profileData: profileData,
                  ),
                  ContactDataForm(
                    contactData: contactData,
                    onValidationChanged: (isValid) {
                      setState(
                        () => _isFormValid = isValid,
                      );
                    },
                    formKey: contactInfoFormKey,
                  ),
                  Flex(direction: Axis.horizontal, children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: ButtonCTA(
                        text: "Guardar datos",
                        onPressed: () {
                          if (!contactInfoFormKey.currentState!.validate() ||
                              !personalInfoFormKey.currentState!.validate()) {
                            return;
                          }
                          contactInfoFormKey.currentState!.save();
                          personalInfoFormKey.currentState!.save();
                          ref
                              .read(authControllerProvider.notifier)
                              .editUser(contactData, profileData);
                        },
                        btnColor: _isFormValid
                            ? SerManosColors.neutral_0
                            : SerManosColors.neutral_50,
                        foregroundColor: _isFormValid
                            ? SerManosColors.neutral_25
                            : SerManosColors.neutral_50,
                        backgroundColor: _isFormValid
                            ? SerManosColors.primary_100
                            : SerManosColors.neutral_25,
                      ),
                    )),
                  ])
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) => const SizedBox.shrink(),
        loading: () => const LoadingIndicator());
  }
}
