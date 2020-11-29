import 'package:flutter/material.dart';

class AppTheme{

  static const TextStyle display1 = TextStyle(
    fontFamily: 'Roboto',
    color: Colors.black,
    fontSize: 38,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2
  );
  static const TextStyle display2 = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 32,
      fontWeight: FontWeight.normal,
      letterSpacing: 1.1
  );
  static const TextStyle heading = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: 34,
      fontWeight: FontWeight.w900,
      letterSpacing: 1.2
  );

  static const TextStyle subHeading = TextStyle(
      inherit: true,
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w500
  );
}