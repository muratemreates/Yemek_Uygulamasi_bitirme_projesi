import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_uygulamasi_bp/data/entity/sepet_yemek.dart';
import 'package:yemek_uygulamasi_bp/data/repo/yemeklerdao_repository.dart';

class SepetSayfaCubit extends Cubit<List<SepetYemek>> {
  SepetSayfaCubit() : super(<SepetYemek>[]);

  var yrepo = YemeklerDaoRepository();

  Future<void> ekle(
    String yemek_adi,
    String yemek_resim_adi,
    String yemek_fiyat,
    String yemek_siparis_adet,
    double ucret,
  ) async {
    await yrepo.ekle(
      yemek_adi,
      yemek_resim_adi,
      yemek_fiyat,
      yemek_siparis_adet,
    );
  }

  Future<void> sil(String sepet_yemek_id) async {
    await yrepo.sil(sepet_yemek_id);
    await sepetYukle();
  }

  Future<void> sepetYukle() async {
    var list = await yrepo.sepetYukle();
    emit(list);
  }

}
