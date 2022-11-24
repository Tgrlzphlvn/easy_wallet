import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension PaddingExtension on BuildContext {
  //* All Paddings
  EdgeInsets get paddingAllLow => EdgeInsets.all(heightValue001);
  EdgeInsets get paddingAllNormal => EdgeInsets.all(heightValue002);
  EdgeInsets get paddingAllMedium => EdgeInsets.all(heightValue003);
  EdgeInsets get paddingAllHigh => EdgeInsets.all(heightValue004);

  //* Horizontal Paddings
  EdgeInsets get paddingHorizontalLow =>
      EdgeInsets.symmetric(horizontal: heightValue001);
  EdgeInsets get paddingHorizontalNormal =>
      EdgeInsets.symmetric(horizontal: heightValue002);
  EdgeInsets get paddingHorizontalMedium =>
      EdgeInsets.symmetric(horizontal: heightValue003);
  EdgeInsets get paddingHorizontalHigh =>
      EdgeInsets.symmetric(horizontal: heightValue004);

  //* Special Paddings
  EdgeInsets get walletCardWidgetsPaddingLow => EdgeInsets.only(
        top: heightValue001,
        right: heightValue003,
        left: heightValue003,
      );
  EdgeInsets get walletCardWidgetsPaddingMedium => EdgeInsets.only(
        top: heightValue002,
        right: heightValue003,
        left: heightValue003,
      );
  EdgeInsets get walletCardWidgetsPaddingHigh => EdgeInsets.only(
        top: heightValue003,
        right: heightValue003,
        left: heightValue003,
      );
}

extension MediaQueryExtension on BuildContext {
  //* MediaQuery
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get heightValue001 => height * 0.01;
  double get heightValue002 => height * 0.02;
  double get heightValue003 => height * 0.03;
  double get heightValue004 => height * 0.04;
  double get heightValue005 => height * 0.05;
  double get heightValue006 => height * 0.06;
  double get heightValue007 => height * 0.07;
  double get heightValue008 => height * 0.08;
  double get heightValue009 => height * 0.09;
  double get heightValue01 => height * 0.1;

  double get widthValue001 => width * 0.01;
  double get widthValue002 => width * 0.02;
  double get widthValue003 => width * 0.03;
  double get widthValue004 => width * 0.04;
  double get widthValue005 => width * 0.05;
  double get widthValue006 => width * 0.06;
  double get widthValue007 => width * 0.07;
  double get widthValue008 => width * 0.08;
  double get widthValue009 => width * 0.09;
  double get widthValue01 => width * 0.1;

  double widthGenerator(double value) => width * value;
  double heightGenerator(double value) => height * value;
}

extension RadiusExtension on BuildContext {
  Radius get radiusVeryLow => Radius.circular(widthValue001);
  Radius get radiusLow => Radius.circular(widthValue002);
  Radius get radiusNormal => Radius.circular(widthValue003);
  Radius get radiusMedium => Radius.circular(widthValue004);
  Radius get radiusHigh => Radius.circular(widthValue005);
  Radius get radiusVeryHigh => Radius.circular(widthValue006);
}

extension BorderRadiusExtension on BuildContext {
  BorderRadius get borderRadiusVeryLow => BorderRadius.all(radiusVeryLow);
  BorderRadius get borderRadiusLow => BorderRadius.all(radiusLow);
  BorderRadius get borderRadiusNormal => BorderRadius.all(radiusNormal);
  BorderRadius get borderRadiusMedium => BorderRadius.all(radiusMedium);
  BorderRadius get borderRadiusHigh => BorderRadius.all(radiusHigh);
  BorderRadius get borderRadiusVeryHigh => BorderRadius.all(radiusVeryHigh);
}
