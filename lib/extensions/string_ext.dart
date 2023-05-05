import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/images.dart';

extension strEtx on String {
  Widget iconImage({double? size, Color? color, BoxFit? fit}) {
    return Image.asset(
      this,
      height: size ?? 34,
      width: size ?? 34,
      fit: fit ?? BoxFit.cover,
      color: Colors.grey,
      errorBuilder: (context, error, stackTrace) => placeHolderWidget(height: size ?? 24, width: size ?? 24, fit: fit ?? BoxFit.cover),
    );
  }

  Widget placeHolderWidget({String? placeHolderImage, double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment}) {
    return Container(
      color: Colors.grey,
      child: Image.asset(
      placeHolderImage ?? placeholder,
        height: height,
        width: width,
        alignment: alignment ?? Alignment.center,
      ),
    );
  }
}