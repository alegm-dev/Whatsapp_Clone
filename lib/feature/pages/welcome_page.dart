import 'package:app/common/extension/custom_theme_extension.dart';
import 'package:app/feature/pages/widgets/custom_elevated_button.dart';
import 'package:app/feature/pages/widgets/languaje_button.dart';
import 'package:app/feature/pages/widgets/privacy_and_terms.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
        ),
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 10,
                  ),
                  child: Image.asset(
                    'assets/images/circle.png',
                    color: context.theme.circleImageColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Column(
                children: [
                  const Text(
                    'Bienvenido a WhatsApp',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const PrivacityandTerms(),
                  CustomElevatedButton(
                    onPressed: () {},
                    text: 'ACEPTAR Y CONITNUAR',
                  ),
                  const SizedBox(height: 50),
                  const LanguageButton()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
