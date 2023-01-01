import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void osSetStatusBarColor({required Color statusBarColor}) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: statusBarColor), // status bar color
  );
}

class Paddings extends EdgeInsets {
  const Paddings.symmetric()
      : super.symmetric(
          horizontal: 24.0,
        );
}

class AllRadius extends BorderRadius {
  AllRadius.buttonRadius() : super.circular(25);
  AllRadius.only() : super.only(topRight: Radius.circular(25), topLeft: Radius.circular(25));
}
