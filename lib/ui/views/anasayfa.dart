import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yemek_uygulamasi_bp/models/renklr.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    var genislik = MediaQuery.of(context).size.width;
    var yukseklik = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: yukseklik * 0.15,
          backgroundColor: Renkler().yesil,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "DoyDoy",
                style: GoogleFonts.bungee(
                  color: Renkler().beyaz,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                      height: yukseklik * 0.075,
                      width: genislik * 0.75,
                      child: const SearchBar(
                        hintText: "Yemek ara..",
                      )),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.person_rounded,
                        size: yukseklik * 0.05,
                      ))
                ],
              )
            ],
          ),
        ),
        body: const Center(
          child: Text("Anasayfa"),
        ));
  }
}
