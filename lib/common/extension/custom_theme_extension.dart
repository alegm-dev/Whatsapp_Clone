import 'package:app/common/utils/coloors.dart';
import 'package:flutter/material.dart';

extension ExtendedTheme on BuildContext {
  CustomThemeExtension get theme {
    return Theme.of(this).extension<CustomThemeExtension>()!;
  }
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  static const lightMode = CustomThemeExtension(
      circleImageColor: Color(0XFF25D366),
      greyColor: greyLight,
      blueColor: blueLight,
      langBtnBgColor: Color(0XFFF7F8FA),
      langBtnHighlightColor: Color(0xFFE8E8ED),
      authAppBarTextColor: greendLight);
  static const darkMode = CustomThemeExtension(
    circleImageColor: greenDark,
    greyColor: greyDark,
    blueColor: blueDark,
    langBtnBgColor: Color(0xFF182229),
    langBtnHighlightColor: Color(0xFF09141A),
    authAppBarTextColor: Color(0XFFE9EDEF),
  );

  final Color? circleImageColor;
  final Color? greyColor;
  final Color? blueColor;
  final Color? langBtnBgColor;
  final Color? langBtnHighlightColor;
  final Color? authAppBarTextColor;

  const CustomThemeExtension({
    this.circleImageColor,
    this.greyColor,
    this.blueColor,
    this.langBtnBgColor,
    this.langBtnHighlightColor,
    this.authAppBarTextColor,
  });
  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? circleImageColor,
    Color? greyColor,
    Color? blueColor,
    Color? langBtnBgColor,
    Color? langBtnHighlightColor,
    Color? authAppBarTextColor,
  }) {
    return CustomThemeExtension(
      circleImageColor: circleImageColor ?? this.circleImageColor,
      greyColor: greyColor ?? this.greyColor,
      blueColor: blueColor ?? this.blueColor,
      langBtnBgColor: langBtnBgColor ?? this.langBtnBgColor,
      langBtnHighlightColor: langBtnBgColor ?? this.langBtnHighlightColor,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
      covariant ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
        circleImageColor:
            Color.lerp(circleImageColor, other.circleImageColor, t),
        greyColor: Color.lerp(greyColor, other.greyColor, t),
        blueColor: Color.lerp(blueColor, other.blueColor, t),
        langBtnBgColor: Color.lerp(langBtnBgColor, other.langBtnBgColor, t),
        langBtnHighlightColor:
            Color.lerp(langBtnBgColor, other.langBtnHighlightColor, t),
        authAppBarTextColor:
            Color.lerp(authAppBarTextColor, other.authAppBarTextColor, t));
  }
}
