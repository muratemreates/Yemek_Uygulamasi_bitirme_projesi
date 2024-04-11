import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_uygulamasi_bp/data/entity/sepet_yemek.dart';
import 'package:yemek_uygulamasi_bp/data/entity/yemekler.dart';
import 'package:yemek_uygulamasi_bp/data/repo/yemeklerdao_repository.dart';

class SepetSayfaCubit extends Cubit<List<SepetYemek>> {
  SepetSayfaCubit() : super(<SepetYemek>[]);

  var yrepo = YemeklerDaoRepository();

  Future<void> ekle(
    String yemek_adi,
    String yemek_resim_adi,
    String yemek_fiyat,
    String yemek_siparis_adet,
  ) async {
    await yrepo.ekle(
      yemek_adi,
      yemek_resim_adi,
      yemek_fiyat,
      yemek_siparis_adet,
    );
  }

  Future<void> sepetYukle() async {
    var list = await yrepo.sepetYukle();
    emit(list);
  }
}
