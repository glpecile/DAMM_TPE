import 'package:SerManos/widgets/cells/forms/contact_data.dart';
import 'package:SerManos/widgets/cells/forms/profile_data.dart';
import 'package:SerManos/widgets/tokens/grid.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/molecules/buttons/button_cta.dart';
import '../widgets/tokens/colors.dart';

class EditProfile extends StatefulWidget {
  static String name = 'edit_profile';
  static String path = name;

  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isFormValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(Icons.close),
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
              formKey: formKey,
            ),
            Flex(direction: Axis.horizontal, children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ButtonCTA(
                  btnColor: SerManosColors.neutral_0,
                  text: "Guardar datos",
                  onPressed: () {},
                  foregroundColor: SerManosColors.neutral_25,
                  backgroundColor: SerManosColors.primary_100,
                ),
              )),
            ])
          ],
        ),
      ),
    );
  }
}
