import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yemek_uygulamasi_bp/models/ekran_boyut.dart';
import 'package:yemek_uygulamasi_bp/models/renkler.dart';
import 'package:yemek_uygulamasi_bp/ui/views/profil.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
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
                    color: Renkler().beyaz,
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
          child: const Center(
            child: Text("Anasayfa"),
          ),
        ));
  }
}
