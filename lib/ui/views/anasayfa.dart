import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yemek_uygulamasi_bp/data/entity/yemekler.dart';
import 'package:yemek_uygulamasi_bp/models/ekran_boyut.dart';
import 'package:yemek_uygulamasi_bp/models/renkler.dart';
import 'package:yemek_uygulamasi_bp/ui/cubit/anasayfa_cubit.dart';
import 'package:yemek_uygulamasi_bp/ui/cubit/sepet_sayfa_cubit.dart';
import 'package:yemek_uygulamasi_bp/ui/views/detay_sayfa.dart';
import 'package:yemek_uygulamasi_bp/ui/views/profil.dart';
import 'package:yemek_uygulamasi_bp/ui/views/sepet_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().yemekleriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: EkranBoyut.yukseklik(context, 0.15),
        backgroundColor: Renkler().yesil,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "DoyDoy",
              style: GoogleFonts.bungee(
                  color: Renkler().sari,
                  fontSize: EkranBoyut.yukseklik(context, 0.05)),
            ),
            Row(
              children: [
                SizedBox(
                    height: EkranBoyut.yukseklik(context, 0.065),
                    width: EkranBoyut.genislik(context, 0.75),
                    child: const SearchBar(
                      hintText: "Yemek ara..",
                    )),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          EkranBoyut.genislik(context, 0.075)),
                      color: Renkler().sari),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Profil()))
                            .then((value) => print("Anasayfaya dönüldü"));
                      },
                      icon: Icon(
                        Icons.person_rounded,
                        size: EkranBoyut.yukseklik(context, 0.05),
                      )),
                )
              ],
            )
          ],
        ),
      ),
      body: Container(
        color: Renkler().beyaz,
        child: BlocBuilder<AnasayfaCubit, List<Yemekler>>(
          builder: (context, yemeklerListesi) {
            if (yemeklerListesi.isNotEmpty) {
              return GridView.builder(
                itemCount: yemeklerListesi.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.8),
                itemBuilder: (context, index) {
                  var yemek = yemeklerListesi[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetaySayfa(yemek: yemek))).then((value) {
                        context.read<AnasayfaCubit>().yemekleriYukle();
                        print("anasayfaya dönüldü");
                      });
                    },
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "DOYDOY",
                            style: GoogleFonts.bungee(color: Renkler().yesil),
                          ),
                          SizedBox(
                            height: EkranBoyut.yukseklik(context, 0.30),
                            child: Image.network(
                                "http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}"),
                          ),
                          Text(
                            yemek.yemek_adi,
                            style: GoogleFonts.bungee(
                                fontSize: EkranBoyut.yukseklik(context, 0.025)),
                          ),
                          //Row(),
                          Row(
                            children: [
                              Text(
                                "${yemek.yemek_fiyat} ₺",
                                style: GoogleFonts.bungee(
                                    fontSize:
                                        EkranBoyut.yukseklik(context, 0.025)),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    print("Sepete eklendi..");
                                  },
                                  tooltip: "Sepete Ekle",
                                  icon: Icon(
                                    Icons.add_shopping_cart_rounded,
                                    size: EkranBoyut.yukseklik(context, 0.040),
                                    color: Renkler().yesil,
                                  ))
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
        ),
      ),
    );
  }
}
