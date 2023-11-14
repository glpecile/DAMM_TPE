import 'package:SerManos/helpers/validation.dart';
import 'package:SerManos/models/contact.dart';
import 'package:SerManos/widgets/molecules/inputs/text_input.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/cupertino.dart';

class ContactDataForm extends StatefulWidget {
  const ContactDataForm({
    super.key,
    this.contactData,
    // TODO: make required
     this.onValidationChanged,
    required this.formKey,
  });

  // TODO: remove ? and pass correct value
  final ContactData? contactData;
  final Function(bool)? onValidationChanged;
  final GlobalKey<FormState>? formKey;

  @override
  State<ContactDataForm> createState() => _ContactDataFormState();
}

class _ContactDataFormState extends State<ContactDataForm> {
  bool _isFormValid = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void _validateForm() {
    var aux = _isFormValid;
    setState(() {
      _isFormValid = emailValidator(emailController.text) == null &&
          phoneValidator(phoneController.text) == null;
    });
    if (_isFormValid != aux) {
      // TODO: remove ! once onValidationChanged is required
      widget.onValidationChanged!(_isFormValid);
    }
  }

  @override
  void initState() {
    emailController.addListener(() {
      _validateForm();
    });
    phoneController.addListener(() {
      _validateForm();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          const Text(
            "Datos de contacto",
            style: SerManosTypography.headline_01(
              color: SerManosColors.neutral_100,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Estos datos serán visibles para los usuarios que vean tu perfil",
            style: SerManosTypography.subtitle_01(
              color: SerManosColors.neutral_100,
            ),
          ),
          const SizedBox(height: 24),
          SerManosTextInput(
            placeholder: "Ej: mimail@mail.com",
            label: "Mail",
            controller: emailController,
            validator: emailValidator,
            onSaved: (String? value) {},
          ),
          const SizedBox(height: 24),
          SerManosTextInput(
            placeholder: "Ej: +541178445459",
            label: "Teléfono",
            controller: phoneController,
            validator: phoneValidator, onSaved: (String? value) {  },
          ),
        ],
      ),
    );
  }
}
