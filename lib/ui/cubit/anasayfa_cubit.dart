import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_uygulamasi_bp/data/entity/yemekler.dart';
import 'package:yemek_uygulamasi_bp/data/repo/yemeklerdao_repository.dart';

class AnasayfaCubit extends Cubit<List<Yemekler>> {
  AnasayfaCubit() : super(<Yemekler>[]);

  var yrepo = YemeklerDaoRepository();

  Future<void> yemekleriYukle() async {
    var list = await yrepo.yemekleriYukle();
    emit(list);
  }
}
