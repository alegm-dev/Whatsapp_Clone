import 'package:app/common/extension/custom_theme_extension.dart';
import 'package:app/common/helper/show_alert_dialog.dart';
import 'package:app/common/utils/coloors.dart';
import 'package:app/feature/pages/widgets/custom_elevated_button.dart';
import 'package:app/feature/pages/widgets/custom_text_field.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_icon_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;

  sendCodeToPhone() {
    final phone = phoneNumberController.text;
    final name = countryNameController.text;

    if (phone.isEmpty) {
      return showAlertDialog(
          context: context, message: "Por favor ingresa un numero de telefono");
    } else if (phone.length < 9) {
      return showAlertDialog(
          context: context,
          message:
              "El numero de telefono que ingresaste es muy corto para $name . \n\nInclui tu codigo de area. ");
    } else if (phone.length > 10) {
      return showAlertDialog(
          context: context, message: 'El numero de telefono es incorrecto');
    }
  }

  showCountryCodePicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: ['AR'],
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: 600,
        // ignore: deprecated_member_use
        backgroundColor: Theme.of(context).backgroundColor,
        flagSize: 22,
        borderRadius: BorderRadius.circular(20),
        textStyle: TextStyle(color: context.theme.greyColor),
        inputDecoration: InputDecoration(
          labelStyle: TextStyle(color: context.theme.greyColor),
          prefixIcon: const Icon(
            Icons.language,
            color: greenDark,
          ),
          hintText: 'Buscar por codigo o nombre del pais',
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: greenDark,
            ),
          ),
        ),
      ),
      onSelect: (country) {
        countryNameController.text = country.name;
        countryCodeController.text = country.countryCode;
      },
    );
  }

  @override
  void initState() {
    countryNameController = TextEditingController(text: 'Argentina');
    countryCodeController = TextEditingController(text: '54');
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    countryNameController.dispose();
    countryCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          'Ingrese su numero de telefono',
          style: TextStyle(color: context.theme.authAppBarTextColor),
        ),
        centerTitle: true,
        actions: [
          CustomIconButton(
            onTap: () {},
            icon: Icons.more_vert,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'WhatsApp necesita verificar tu numero de telefono. ',
                  style: TextStyle(
                    color: context.theme.greyColor,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                        text: '¿Cual es mi numero?',
                        style: TextStyle(
                          color: context.theme.blueColor,
                        ))
                  ]),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomTextField(
              onTap: () => showCountryCodePicker(),
              controller: countryNameController,
              readOnly: true,
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
                color: greenDark,
                size: 22,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  child: CustomTextField(
                    onTap: () => showCountryCodePicker(),
                    controller: countryCodeController,
                    prefixText: '+',
                    readOnly: true,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    controller: phoneNumberController,
                    hintText: 'Numero de telefono',
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Se pueden aplicar cargos',
            style: TextStyle(
              color: context.theme.greyColor,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        onPressed: sendCodeToPhone,
        text: 'SIGUIENTE',
        buttonWidth: 120,
      ),
    );
  }
}
