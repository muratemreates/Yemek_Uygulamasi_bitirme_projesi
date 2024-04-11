import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:yemek_uygulamasi_bp/data/entity/sepet_yemek.dart';
import 'package:yemek_uygulamasi_bp/data/entity/sepet_yemek_cevap.dart';
import 'package:yemek_uygulamasi_bp/data/entity/yemek_cevap.dart';
import 'package:yemek_uygulamasi_bp/data/entity/yemekler.dart';

class YemeklerDaoRepository {
  var kullaniciAdi = "murat_emre";
  List<Yemekler> parseYemekler(String cevap) {
    return YemeklerCevap.fromJson(json.decode(cevap)).yemekler;
  }

  List<SepetYemek> parseSepetYemekler(String cevap) {
    return SepetYemekCevap.fromJson(json.decode(cevap)).sepet_yemekler;
  }

  Future<List<Yemekler>> yemekleriYukle() async {
    var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var cevap = await Dio().get(url);
    return parseYemekler(cevap.data);
  }

  Future<void> sil(String sepet_yemek_id) async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php";
    var veri = {
      "sepet_yemek_id": sepet_yemek_id,
      "kullanici_adi": kullaniciAdi
    };
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print("Sipariş silindi : ${cevap.data.toString()}");
  }

  Future<void> ekle(
    String yemek_adi,
    String yemek_resim_adi,
    String yemek_fiyat,
    String yemek_siparis_adet,
  ) async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php";
    var veri = {
      "yemek_adi": yemek_adi,
      "yemek_resim_adi": yemek_resim_adi,
      "yemek_fiyat": yemek_fiyat,
      "yemek_siparis_adet": yemek_siparis_adet,
      "kullanici_adi": kullaniciAdi
    };
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print("Kişi kaydet : ${cevap.data.toString()} : $kullaniciAdi");
  }

  Future<List<SepetYemek>> sepetYukle() async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php";
    var veri = {"kullanici_adi": kullaniciAdi};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    return parseSepetYemekler(cevap.data.toString());
  }


}
