import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yemek_uygulamasi_bp/data/entity/sepet_yemek.dart';
import 'package:yemek_uygulamasi_bp/data/entity/yemekler.dart';
import 'package:yemek_uygulamasi_bp/models/ekran_boyut.dart';
import 'package:yemek_uygulamasi_bp/models/renkler.dart';
import 'package:yemek_uygulamasi_bp/ui/cubit/sepet_sayfa_cubit.dart';

class SepetSayfa extends StatefulWidget {
  SepetSayfa({
    required this.adet,
    required this.fiyat
  });
  int adet;
  double fiyat;

  @override
  State<SepetSayfa> createState() => _SepetSayfaState();
}

class _SepetSayfaState extends State<SepetSayfa> {
  @override
  void initState() {
    super.initState();
    context.read<SepetSayfaCubit>().sepetYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Renkler().yesil,
        title: Text(
          "Sepet",
          style: GoogleFonts.bungee(),
        ),
      ),
      body: BlocBuilder<SepetSayfaCubit, List<SepetYemek>>(
        builder: (context, yemekListesi) {
          if (yemekListesi.isNotEmpty) {
            return ListView.builder(
              itemCount: yemekListesi.length,
              itemBuilder: (context, index) {
                var yemek = yemekListesi[index];
                return Card(
                  child: SizedBox(
                    height: EkranBoyut.yukseklik(context, 0.20),
                    child: Row(
                      children: <Widget>[
                        Image.network(
                            "http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}"),
                        Text(yemek.yemek_adi),
                      ],
                    ),
                  ),
                );
                //context.read<SepetSayfaCubit>().sepetYukle();
              },
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
