import 'package:yemek_uygulamasi_bp/data/entity/sepet_yemek.dart';

class SepetYemekCevap {
  SepetYemekCevap({required this.sepet_yemekler, required this.success});
  List<SepetYemek> sepet_yemekler;
  int success;

  factory SepetYemekCevap.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["sepet_yemekler"] as List;
    int success = json["success"] as int;
    var sepet_yemekler = jsonArray
        .map((jsonArrayNesnesi) => SepetYemek.fromJson(jsonArrayNesnesi))
        .toList();

    return SepetYemekCevap(sepet_yemekler: sepet_yemekler, success: success);
  }
}
