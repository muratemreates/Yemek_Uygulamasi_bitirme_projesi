import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yemek_uygulamasi_bp/data/entity/yemekler.dart';
import 'package:yemek_uygulamasi_bp/models/ekran_boyut.dart';
import 'package:yemek_uygulamasi_bp/models/renkler.dart';
import 'package:yemek_uygulamasi_bp/ui/cubit/yemek_listesi_cubit.dart';

class YemekKatalog extends StatefulWidget {
  const YemekKatalog({super.key});

  @override
  State<YemekKatalog> createState() => _YemekKatalogState();
}

class _YemekKatalogState extends State<YemekKatalog> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<YemekListesiCubit>().yemekleriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Yemek Kataloğu',
            style: GoogleFonts.bungee(),
          ),
          backgroundColor: Renkler().yesil,
        ),
        body: BlocBuilder<YemekListesiCubit, List<Yemekler>>(
          builder: (context, yemekListesi) {
            if (yemekListesi.isNotEmpty) {
              return ListView.builder(
                itemCount: yemekListesi.length,
                itemBuilder: (context, index) {
                  var yemek = yemekListesi[index];
                  return SizedBox(
                    height: EkranBoyut.yukseklik(context, 0.2),
                    child: Card(
                      child: Row(
                        children: <Widget>[
                          Image.network(
                              "http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}"),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                yemek.yemek_adi,
                                style: GoogleFonts.bungee(
                                    fontSize:
                                        EkranBoyut.yukseklik(context, 0.025),
                                    color: Renkler().yesil),
                              ),
                              Text(
                                "${yemek.yemek_fiyat} ₺",
                                style: GoogleFonts.bungee(
                                  fontSize:
                                      EkranBoyut.yukseklik(context, 0.030),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center();
            }
          },
        ));
  }
}
