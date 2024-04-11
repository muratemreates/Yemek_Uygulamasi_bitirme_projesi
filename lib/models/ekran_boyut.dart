import 'package:flutter/material.dart';

class EkranBoyut {
 static double yukseklik(BuildContext context, double sayi) {
    var yukseklik = MediaQuery.of(context).size.height;
    return yukseklik * sayi;
  }

  static double genislik(BuildContext context, double sayi) {
    var genislik = MediaQuery.of(context).size.width;
    return genislik * sayi;
  }

  static double ekranGenisligi(BuildContext context) {
    var ekrangenisligi = MediaQuery.of(context).size.width;
    return ekrangenisligi;
  }
   static double ekranYuksekligi(BuildContext context) {
    var ekranYuksekligi = MediaQuery.of(context).size.height;
    return ekranYuksekligi;
  }
}