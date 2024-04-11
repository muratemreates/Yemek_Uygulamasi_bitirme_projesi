import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yemek_uygulamasi_bp/data/entity/yemekler.dart';
import 'package:yemek_uygulamasi_bp/models/ekran_boyut.dart';
import 'package:yemek_uygulamasi_bp/models/renkler.dart';
import 'package:yemek_uygulamasi_bp/ui/cubit/anasayfa_cubit.dart';
import 'package:yemek_uygulamasi_bp/ui/cubit/sepet_sayfa_cubit.dart';
import 'package:yemek_uygulamasi_bp/ui/cubit/yemek_listesi_cubit.dart';
import 'package:yemek_uygulamasi_bp/ui/views/anasayfa.dart';
import 'package:yemek_uygulamasi_bp/ui/views/detay_sayfa.dart';
import 'package:yemek_uygulamasi_bp/ui/views/sepet_sayfa.dart';
import 'package:yemek_uygulamasi_bp/ui/views/yemek_listesi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var sayfalar = [const Anasayfa(), YemekKatalog(), SepetSayfa(adet: 0, fiyat: 0)];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnasayfaCubit()),
        BlocProvider(create: (context) => YemekListesiCubit()),
        BlocProvider(create: (context) => SepetSayfaCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Yemek Uygulaması",
        home: Scaffold(
          body: sayfalar[index],
          bottomNavigationBar: CurvedNavigationBar(
            iconPadding: EkranBoyut.yukseklik(context, 0.0175),
            animationCurve: Curves.elasticInOut,
            animationDuration: Durations.long1,
            buttonBackgroundColor: Renkler().sari,
            height: EkranBoyut.yukseklik(context, 0.1),
            backgroundColor: Colors.transparent,
            color: Renkler().yesil,
            items: [
              CurvedNavigationBarItem(
                labelStyle: GoogleFonts.bungee(color: Renkler().beyaz),
                child: Icon(
                  Icons.menu_book_rounded,
                  size: EkranBoyut.yukseklik(context, 0.05),
                ),
                label: 'Ana Sayfa',
              ),
              CurvedNavigationBarItem(
                labelStyle: GoogleFonts.bungee(color: Renkler().beyaz),
                child: Icon(
                  Icons.local_pizza_rounded,
                  size: EkranBoyut.yukseklik(context, 0.05),
                ),
                label: 'Yemek Listesi',
              ),
              CurvedNavigationBarItem(
                labelStyle: GoogleFonts.bungee(color: Renkler().beyaz),
                child: Stack(children: [
                  Icon(
                    Icons.shopping_basket_rounded,
                    size: EkranBoyut.yukseklik(context, 0.05),
                  ),
                  const Positioned(
                      left: 20,
                      child: Icon(
                        Icons.circle,
                        color: Colors.red,
                        size: 21,
                      ))
                ]),
                label: 'Sepet',
              ),
            ],
            onTap: (index) {
              setState(() {
                this.index = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
