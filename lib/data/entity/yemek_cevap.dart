import 'package:yemek_uygulamasi_bp/data/entity/yemekler.dart';

class YemeklerCevap {
  YemeklerCevap({required this.yemekler, required this.success});
  List<Yemekler> yemekler;
  int success;

  factory YemeklerCevap.fromJson(Map<String, dynamic> json) {
    var jsonarray = json["yemekler"] as List;
    int success = json["success"] as int;
    var yemekler = jsonarray.map((jsonArrayNesnesi) => Yemekler.fromJson(jsonArrayNesnesi)).toList();

    return YemeklerCevap(yemekler: yemekler, success: success);
  }
}
