import 'package:flutter/cupertino.dart';

enum ImageEnums { facebook, gmail }

extension ImageEnumExtension on ImageEnums {
  String get _toPng => 'assets/images/png/$name.png';

  Image get toPng => Image.asset(_toPng);
}
