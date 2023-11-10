import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pallete {
  static const Color main = Color(0XFF35CC33);
  static const Color mainDarker = Color(0XFF3BA639);
  static const Color mainLigther = Color(0XFF9BFF99);
  static const Color mainSubtle = Color(0XFFE3FFE3);

  static const Color secondary = Color(0XFFFFCD29);
  static const Color secondaryDarker = Color(0XFFD4AF35);
  static const Color secondaryLigther = Color(0XFFFFE799);
  static const Color secondarySubtle = Color(0XFFFFF8E3);

  static const Color error = Color(0XFFFF0000);
  static const Color errorDarker = Color(0XFFE53535);
  static const Color errorLigther = Color(0XFFFF5C5C);
  static const Color errorSubtle = Color(0XFFFF8080);
  static const Color errorBackground = Color(0xffFEF1F1);

  static const Color warning = Color(0XFFFFCC00);
  static const Color warningDarker = Color(0XFFE5B800);
  static const Color warningLigther = Color(0XFFFDD948);
  static const Color warningSubtle = Color(0XFFFDE172);

  static const Color info = Color(0XFF0033FF);
  static const Color infoDarker = Color(0XFF0027C4);
  static const Color infoLigther = Color(0XFF5B79EF);
  static const Color infoSubtle = Color(0XFF9DAFF9);

  static const Color success = Color(0XFF00FF90);
  static const Color successDarker = Color(0XFF05A660);
  static const Color successLigther = Color(0XFF39D98A);
  static const Color successSubtle = Color(0XFF57EBA1);

  static const Color dark1 = Color(0XFF333333);
  static const Color dark2 = Color(0XFF4F4F4F);
  static const Color dark3 = Color(0XFF828282);
  static const Color dark4 = Color(0XFFBDBDBD);

  static const Color light1 = Color(0XFFC7C9D9);
  static const Color light2 = Color(0XFFEBEBF0);
  static const Color light3 = Color(0XFFF2F2F5);
  static const Color light4 = Color(0XFFF8F8FA);

  // Text color ?
  static const Color textSecondary = Color(0XFF64748B);
  static const Color textMainButton = Color(0XFFFFFFFF);
}

class ThemeFont {
  static TextStyle display1 = GoogleFonts.inter(
    fontSize: 48,
    fontWeight: FontWeight.w200,
  );
  static TextStyle display2 = GoogleFonts.inter(
    fontSize: 40,
    fontWeight: FontWeight.w300,
  );
  static TextStyle interText = GoogleFonts.inter();

  static TextStyle heading3 = GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.w500,
  );
  static TextStyle heading5 = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static TextStyle heading6 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle bodyNormal = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle mulishText = GoogleFonts.mulish(
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );

//herliana
  // static TextStyle heading6 = GoogleFonts.inter(
  //   fontSize: 16,
  //   fontWeight: FontWeight.w500,
  // );

  // static TextStyle bodyNormal = GoogleFonts.inter(
  //   fontSize: 16,
  //   fontWeight: FontWeight.w600,
  // );

  // static TextStyle bodySmall = GoogleFonts.inter(
  //   fontSize: 14,
  //   fontWeight: FontWeight.w400,
  // );

  static TextStyle heading6Medium = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle bodySmallMedium = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle bodyNormalSemiBold = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bodySmallRegular = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}
