import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yemek_uygulamasi_bp/data/entity/yemekler.dart';
import 'package:yemek_uygulamasi_bp/models/ekran_boyut.dart';
import 'package:yemek_uygulamasi_bp/models/renkler.dart';
import 'package:yemek_uygulamasi_bp/ui/cubit/sepet_sayfa_cubit.dart';
import 'package:yemek_uygulamasi_bp/ui/views/sepet_sayfa.dart';

class DetaySayfa extends StatefulWidget {
  DetaySayfa({required this.yemek});
  Yemekler yemek;
  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  int adet = 0;
  double fiyat = 0;
  bool sepeteEkle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Yemek Detay",
          style: GoogleFonts.bungee(),
        ),
        backgroundColor: Renkler().yesil,
      ),
      body: Container(
        color: Renkler().beyaz,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 270),
                child: Stack(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SepetSayfa()));
                        },
                        icon: Icon(
                          Icons.shopping_basket_rounded,
                          size: EkranBoyut.yukseklik(context, 0.05),
                        )),
                    Positioned(
                        left: 30,
                        bottom: 20,
                        child: Visibility(
                          visible: sepeteEkle,
                          child: const Icon(
                            Icons.circle,
                            color: Colors.red,
                          ),
                        )),
                  ],
                ),
              ),
              Image.network(
                  "http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek.yemek_resim_adi}"),
              Text(
                "${widget.yemek.yemek_fiyat} ₺",
                style: GoogleFonts.bungee(
                    fontSize: EkranBoyut.yukseklik(context, 0.050),
                    color: Renkler().yesil),
              ),
              Text(
                widget.yemek.yemek_adi,
                style: GoogleFonts.bungee(
                    fontSize: EkranBoyut.yukseklik(context, 0.05)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () => setState(() {
                      adet > 0 ? adet-- : adet = 0;
                      fiyat = (double.parse(widget.yemek.yemek_fiyat) * adet);
                    }),
                    child: Icon(
                      Icons.remove,
                      color: Renkler().beyaz,
                    ),
                  ),
                  Text(
                    adet.toString(),
                    style: GoogleFonts.bungee(
                        fontSize: EkranBoyut.yukseklik(context, 0.05)),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Renkler().yesil),
                      onPressed: () => setState(() {
                            adet++;
                            fiyat =
                                (double.parse(widget.yemek.yemek_fiyat) * adet);
                          }),
                      child: Icon(
                        Icons.add,
                        color: Renkler().beyaz,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "$fiyat ₺",
                    style: GoogleFonts.bungee(
                        fontSize: EkranBoyut.yukseklik(context, 0.03)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (adet > 0) {
                        context.read<SepetSayfaCubit>().ekle(
                            widget.yemek.yemek_adi,
                            widget.yemek.yemek_resim_adi,
                            widget.yemek.yemek_fiyat,
                            adet.toString(),
                            fiyat);
                        setState(() {
                          sepeteEkle = true;
                        });
                      } else {
                        print("Adet en az 1 olmalı");
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Sepete Ekle",
                          style: GoogleFonts.bungee(
                              fontSize: EkranBoyut.yukseklik(context, 0.025),
                              color: Renkler().yesil),
                        ),
                        const Icon(Icons.shopping_cart_checkout_rounded)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
