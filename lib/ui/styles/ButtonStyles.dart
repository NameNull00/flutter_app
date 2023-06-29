import 'package:flutter/material.dart';
import 'package:app/ui/styles/Colors.dart';


class TorneosBtnStyles{
  static ButtonStyle ROUND_VERDE = ElevatedButton.styleFrom(
    backgroundColor: SelfColors.PALETTE_SEC,
    foregroundColor: SelfColors.PALETTE_TER,
    shadowColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20)
    )
  );
  static ButtonStyle FILTER_ICON = IconButton.styleFrom(
    backgroundColor: SelfColors.PALETTE_PRI,
    foregroundColor: Colors.white,
  );
}