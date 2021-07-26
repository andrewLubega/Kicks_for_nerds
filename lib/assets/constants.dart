import 'package:flutter/material.dart';

const kBaseWidgetColor = Color(0xFFE0E0E0);
const kBlackCustomClr = Color(0xFF0F0F0F);

const kMagentaClr = Color(0xFFFF006B);
const kPurpleClr = Color(0xFF9C01AE);

const kGradClr = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [kMagentaClr, kPurpleClr],
  ),
);

const kSolidGrad = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [kBlackCustomClr, kBlackCustomClr],
  ),
);

const kTopContentMargin = EdgeInsets.only(
  left: 24,
  right: 24,
  top: 59,
);

const kContentMargin = EdgeInsets.only(
  left: 24,
  right: 24,
);

const kLeftContentMargin = EdgeInsets.only(
  left: 24,
);

const kRightContentMargin = EdgeInsets.only(
  right: 24,
);

const kRadiusNumber = 24.0;

const kTopBoxCurves = BorderRadius.vertical(
  top: Radius.circular(kRadiusNumber),
);

const kFontColour = Colors.white;

const kActiveButtonClr = kGradClr;

const kInActiveButtonClr = kBlackCustomClr;

const kLightBGClr = Colors.white;

const kDarkbgClr = kBlackCustomClr;

const kBGClr = kLightBGClr;

const kBoldTxt = FontWeight.bold;

const kLightTxt = FontWeight.w100;

const kFontSize12 = 12.0;
const kFontSize18 = 18.0;

const kFontSize36 = 36.0;
