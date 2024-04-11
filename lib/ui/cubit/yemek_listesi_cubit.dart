import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_uygulamasi_bp/data/entity/yemekler.dart';
import 'package:yemek_uygulamasi_bp/data/repo/yemeklerdao_repository.dart';

class YemekListesiCubit extends Cubit<List<Yemekler>> {
  YemekListesiCubit() : super(<Yemekler>[]);

  var yrepo = YemeklerDaoRepository();

    Future<void> yemekleriYukle() async {
    var list = await yrepo.yemekleriYukle();
    emit(list);
  }
}
