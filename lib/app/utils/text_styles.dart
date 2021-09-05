import 'dart:core';

import 'package:flutter/material.dart';

class TextStyles{
  static const double _kH1FontSize = 20;
  static const double _kH2FontSize = 18;
  static const double _kH3FontSize = 16;
  static const double _kH4FontSize = 14;
  static const double _kH5FontSize = 12;

//******* Bold fonts */
  static const kTextH1BlackBold = TextStyle(
    fontSize: _kH1FontSize,
    fontWeight: FontWeight.bold,
    color: Colors.black
  );

  static const kTextH2BlackBold = TextStyle(
    fontSize: _kH2FontSize,
    fontWeight: FontWeight.bold,
    color: Colors.black
  );

  static const kTextH3BlackBold = TextStyle(
    fontSize: _kH3FontSize,
    fontWeight: FontWeight.bold,
    color: Colors.black
  );

  static const kTextH4BlackBold = TextStyle(
    fontSize: _kH3FontSize,
    fontWeight: FontWeight.bold,
    color: Colors.black
  );

  static const kTextH5BlackBold = TextStyle(
    fontSize: _kH3FontSize,
    fontWeight: FontWeight.bold,
    color: Colors.black
  );

  //******* Medium Fonts */
  static const kTextH1BlackMedium = TextStyle(
    fontSize: _kH1FontSize,
    fontWeight: FontWeight.w500,
    color: Colors.black
  );

  static const kTextH2BlackMedium = TextStyle(
    fontSize: _kH2FontSize,
    fontWeight: FontWeight.w500,
    color: Colors.black
  );

  static const kTextH3BlackMedium = TextStyle(
    fontSize: _kH3FontSize,
    fontWeight: FontWeight.w500,
    color: Colors.black
  );

  static const kTextH4BlackMedium = TextStyle(
    fontSize: _kH4FontSize,
    fontWeight: FontWeight.w500,
    color: Colors.black
  );

  static const kTextH5BlackMedium = TextStyle(
    fontSize: _kH5FontSize,
    fontWeight: FontWeight.w500,
    color: Colors.black
  );

  ///// Regular fonts
  static const kTextH1BlackRegular = TextStyle(
    fontSize: _kH1FontSize,
    fontWeight: FontWeight.w300,
    color: Colors.black
  );

  static const kTextH2BlackRegular = TextStyle(
    fontSize: _kH2FontSize,
    fontWeight: FontWeight.w300,
    color: Colors.black
  );

  static const kTextH3BlackRegular = TextStyle(
    fontSize: _kH3FontSize,
    fontWeight: FontWeight.w300,
    color: Colors.black
  );

  static const kTextH4BlackRegular = TextStyle(
    fontSize: _kH4FontSize,
    fontWeight: FontWeight.w300,
    color: Colors.black
  );

  static const kTextH5BlackRegular = TextStyle(
    fontSize: _kH5FontSize,
    fontWeight: FontWeight.w300,
    color: Colors.black
  );
}

const TextStyle kStyleAppBar = TextStyles.kTextH1BlackMedium;