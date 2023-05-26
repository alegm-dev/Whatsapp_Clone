import 'package:app/common/extension/custom_theme_extension.dart';
import 'package:app/feature/pages/widgets/custom_icon_button.dart';
import 'package:app/feature/pages/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  late TextEditingController codeController;

  @override
  void initState() {
    codeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        title: Text(
          'Verificacion de numero',
          style: TextStyle(
            color: context.theme.authAppBarTextColor,
          ),
        ),
        centerTitle: true,
        actions: [
          CustomIconButton(
            onTap: () {},
            icon: Icons.more_vert,
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    color: context.theme.greyColor,
                    height: 1.5,
                  ),
                  children: [
                    const TextSpan(
                      text:
                          'Has intentado registrarte en el +54123456789, antes de solicitar un SMS o llamada con tu código.',
                    ),
                    TextSpan(
                        text: '¿Numero equivocado?',
                        style: TextStyle(
                          color: context.theme.blueColor,
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: CustomTextField(
                controller: codeController,
                hintText: '- - -  - - -',
                fontSize: 30,
                autoFocus: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {},
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Ingrese 6 digitos',
              style: TextStyle(
                color: context.theme.greyColor,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.message,
                  color: context.theme.greyColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Reenviar SMS',
                  style: TextStyle(
                    color: context.theme.greyColor,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              color: context.theme.blueColor!.withOpacity(0.2),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: context.theme.greyColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'LLamame',
                  style: TextStyle(
                    color: context.theme.greyColor,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              color: context.theme.blueColor!.withOpacity(0.2),
            )
          ],
        ),
      )),
    );
  }
}
