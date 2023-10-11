import 'dart:io';

import 'package:SerManos/helpers/gender.dart';
import 'package:SerManos/models/profile.dart';
import 'package:SerManos/widgets/cells/cards/card_input.dart';
import 'package:SerManos/widgets/cells/forms/contact_data.dart';
import 'package:SerManos/widgets/cells/forms/radio_button.dart';
import 'package:SerManos/widgets/molecules/inputs/date_input.dart';
import 'package:SerManos/widgets/molecules/inputs/ser_manos_photo_input.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/cupertino.dart';

class ProfileDataForm extends StatefulWidget {
  // TODO: remove ?
  final ProfileData? profileData;
  final Function(bool)? onValidationChanged;
  final GlobalKey<FormState>? formKey;

  const ProfileDataForm({
    super.key,
    // TODO add required
    this.profileData,
    this.onValidationChanged,
    this.formKey,
  });

  @override
  State<ProfileDataForm> createState() => _ProfileDataFormState();
}

class _ProfileDataFormState extends State<ProfileDataForm> {
  bool _isValid = true;
  late TextEditingController dateController;

  setGender(Gender gender) {
    widget.profileData?.gender = gender;
  }

  void validate() {
    bool aux = _isValid;
    setState(() {
      _isValid = widget.formKey?.currentState?.validate() ?? false;
    });
    if (aux != _isValid) {
      widget.onValidationChanged!(_isValid);
    }
  }

  @override
  void initState() {
    super.initState();
    dateController =
        TextEditingController(text: widget.profileData?.dateOfBirth);
    dateController.addListener(validate);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Datos de perfil",
            style: SerManosTypography.headline_01(),
          ),
          const SizedBox(
            height: 24,
          ),
          Form(
            child: Column(
              children: [
                SerManosDateInput(
                  label: "DD/MM/YYYY",
                  placeholder: "Fecha de nacimiento",
                  controller: dateController,
                  onSaved: (String? date) {
                    widget.profileData?.dateOfBirth = date;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                CardInput(
                    title: "Información del usuario",
                    onPressed: (value) {
                      setGender(value!);
                    }),
                const SizedBox(
                  height: 24,
                ),
                SerManosPhotoInput(
                  // TODO: send correct method + fix modal
                  onSaved: (File image) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
