import 'package:app/common/extension/custom_theme_extension.dart';
import 'package:app/common/utils/coloors.dart';
import 'package:flutter/material.dart';

class PrivacityandTerms extends StatelessWidget {
  const PrivacityandTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      child: RichText(
        text: TextSpan(
          text: 'Leer abajo ',
          style: const TextStyle(
            color: greyDark,
            height: 1.5,
          ),
          children: [
            TextSpan(
              text: 'Politica de privacidad. ',
              style: TextStyle(
                color: context.theme.blueColor,
                height: 1.5,
              ),
            ),
            const TextSpan(
              text: 'Presiona "Acepto y continuar" para aceptar los ',
              style: TextStyle(
                color: greyDark,
                height: 1.5,
              ),
            ),
            TextSpan(
              text: 'Terminos y servicios',
              style: TextStyle(
                color: context.theme.blueColor,
                height: 1.5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
