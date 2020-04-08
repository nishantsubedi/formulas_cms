import 'package:flutter/cupertino.dart';

const double kDesignScreenWidth = 414;

double deviceExactWidth(double width, BuildContext context) {
  var m = MediaQuery.of(context);
  return (width / kDesignScreenWidth) * MediaQuery.of(context).size.width;
}