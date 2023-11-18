import 'dart:io';

import 'package:SerManos/helpers/gender.dart';
import 'package:SerManos/models/profile.dart';
import 'package:SerManos/widgets/cells/cards/gender_input.dart';
import 'package:SerManos/widgets/molecules/inputs/date_input.dart';
import 'package:SerManos/widgets/molecules/inputs/ser_manos_photo_input.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/cupertino.dart';

class ProfileDataForm extends StatefulWidget {
  final ProfileData profileData;
  final Function(bool)? onValidationChanged;
  final GlobalKey<FormState>? formKey;

  const ProfileDataForm({
    super.key,
    required this.profileData,
    this.onValidationChanged,
    this.formKey,
  });

  @override
  State<ProfileDataForm> createState() => _ProfileDataFormState();
}

class _ProfileDataFormState extends State<ProfileDataForm> {
  bool _isValid = true;
  late TextEditingController dateController;

  setGender(Gender? gender) {
    if (gender == null) {
      return;
    }
    widget.profileData.gender = gender;
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
        TextEditingController(text: widget.profileData.dateOfBirth);
    dateController.addListener(validate);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
          key: widget.formKey,
          child: Column(
            children: [
              SerManosDateInput(
                label: "DD/MM/YYYY",
                placeholder: "Fecha de nacimiento",
                controller: dateController,
                onSaved: (String? date) {
                  widget.profileData.dateOfBirth = date;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              GenderInput(
                title: "Información de perfil",
                onPressed: (value) {
                  setGender(value);
                },
                previousGender: widget.profileData.gender,
              ),
              const SizedBox(
                height: 24,
              ),
              SerManosPhotoInput(
                imageUrl: widget.profileData.imageUrl,
                onSaved: (File image) {
                  widget.profileData.imageFile = image;
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
