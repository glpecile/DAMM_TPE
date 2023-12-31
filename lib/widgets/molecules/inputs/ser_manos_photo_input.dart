import 'dart:io';

import 'package:SerManos/widgets/molecules/avatar.dart';
import 'package:SerManos/widgets/molecules/buttons/short_button.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class SerManosPhotoInput extends StatefulWidget {
  final String? imageUrl;
  final Function(File) onSaved;

  const SerManosPhotoInput({super.key, this.imageUrl, required this.onSaved});

  @override
  State<SerManosPhotoInput> createState() => _SerManosPhotoInputState();
}

class _SerManosPhotoInputState extends State<SerManosPhotoInput> {
  final _logger = Logger();
  File? _image;

  void pickImage(ImageSource source, BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        _logger.i('Image was null');
        return;
      }
      setState(() {
        _logger.i('Setting image');
        _image = File(image.path);
        widget.onSaved(_image!);
      });
    } on PlatformException catch (e) {
      _logger.e('Missing permissions', error: e);
    }
  }

  handleTap(BuildContext context) async {
    pickImage(ImageSource.gallery, context);
  }

  @override
  Widget build(BuildContext context) {
    bool isChangePhoto = widget.imageUrl != null || _image != null;
    bool isAddPhoto = widget.imageUrl == null && _image == null;

    return Container(
        decoration: const BoxDecoration(
          color: SerManosColors.secondary_25,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  "Foto de perfil",
                  style: SerManosTypography.subtitle_01(
                      color: SerManosColors.neutral_100),
                ),
                (isChangePhoto)
                    ? ShortButton(
                        onPressed: () => handleTap(context),
                        text: "Cambiar foto",
                        size: Size.medium,
                        btnColor: SerManosColors.neutral_0,
                        foregroundColor: SerManosColors.primary_10,
                        backgroundColor: SerManosColors.primary_100,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            (isAddPhoto)
                ? ShortButton(
                    onPressed: () => handleTap(context),
                    text: "Subir foto",
                    size: Size.medium,
                    btnColor: SerManosColors.neutral_0,
                    foregroundColor: SerManosColors.primary_10,
                    backgroundColor: SerManosColors.primary_100,
                  )
                : (_image != null)
                    ? Avatar(imageFile: _image)
                    : Avatar(
                        imageUrl: widget.imageUrl,
                      ),
          ],
        ));
  }
}
