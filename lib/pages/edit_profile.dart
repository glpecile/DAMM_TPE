import 'package:SerManos/widgets/cells/forms/contact_data.dart';
import 'package:SerManos/widgets/cells/forms/profile_data.dart';
import 'package:SerManos/widgets/tokens/grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/molecules/buttons/button_cta.dart';
import '../widgets/tokens/colors.dart';

class EditProfile extends StatelessWidget {
  static String name = 'edit_profile';
  static String path = '$name';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isFormValid = false;

  EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 32),
      child: Scaffold(
        body: SerManosGrid(
          child: ListView(
            children: [
              ProfileDataForm(
                onValidationChanged: (isValid) {
                  _isFormValid = isValid;
                },
                formKey: formKey,
              ),
              ContactDataForm(
                onValidationChanged: (isValid) {
                  _isFormValid = isValid;
                },
                formKey: formKey,
              ),
              Flex(
                  direction: Axis.horizontal,
                  children: [Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: ButtonCTA(
                          btnColor: SerManosColors.neutral_0,
                          text: "Guardar datos",
                          onPressed: (){
                          },
                          foregroundColor: SerManosColors.neutral_25,
                          backgroundColor: SerManosColors.primary_100,
                        ),
                      )
                  ),]
              )
            ],
          ),
        ),
      ),
    );}
}