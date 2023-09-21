import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pallet.dart';

class TextStyles {
  static TextStyle headline1 = GoogleFonts.merriweatherSans(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w900,
      fontSize: 42,
      color: Pallet.darkText);

  static TextStyle get headline2 => GoogleFonts.merriweatherSans(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 36,
        color: Pallet.darkText,
      );
}
