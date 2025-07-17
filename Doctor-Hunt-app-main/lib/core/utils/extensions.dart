import 'package:doctor_hunt/core/utils/enums.dart';
import 'package:flutter/material.dart';

extension FontWeightExtension on FontWeightType {
  FontWeight get fontWeight {
    switch (this) {
      case FontWeightType.light:
        return FontWeight.w300;
      case FontWeightType.regular:
        return FontWeight.w400;
      case FontWeightType.medium:
        return FontWeight.w500;
      case FontWeightType.semiBold:
        return FontWeight.w600;
      case FontWeightType.bold:
        return FontWeight.w700;
      case FontWeightType.extraBold:
        return FontWeight.w800;
      case FontWeightType.black:
        return FontWeight.w900;
    }
  }
}
