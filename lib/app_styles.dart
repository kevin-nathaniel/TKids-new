import 'package:flutter/material.dart';
import './size_configs.dart';

const Color PrimaryColor = Color(0xe51cc2fa);
const Color SecondaryColor = Color(0xff000000);
const Color ScaffoldBackground = Color(0xffFFF3E9);

final kTitle = TextStyle(
  fontFamily: 'Klasik',
  fontSize: SizeConfig.blockSizeH! * 7,
  color: SecondaryColor,
);

final kTitle1 = TextStyle(
  fontFamily: 'Klasik',
  fontSize: SizeConfig.blockSizeH?.toDouble() ?? 0,
  color: SecondaryColor,
);

final kBodyText1 = TextStyle(
  color: SecondaryColor,
  fontSize: SizeConfig.blockSizeH! * 4.5,
  fontWeight: FontWeight.bold,
);

final kBodyText2 = TextStyle(
  color: SecondaryColor,
  fontSize: SizeConfig.blockSizeH! * 4,
  fontWeight: FontWeight.bold,
);

final kBodyText3 = TextStyle(
  color: SecondaryColor,
  fontSize: SizeConfig.blockSizeH! * 3.8,
  fontWeight: FontWeight.normal,
);

final kInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: BorderSide.none,
);

final kInputHintStyle = kBodyText2.copyWith(
  fontWeight: FontWeight.normal,
  color: SecondaryColor.withOpacity(0.5),
);
