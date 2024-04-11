import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yemek_uygulamasi_bp/models/ekran_boyut.dart';
import 'package:yemek_uygulamasi_bp/models/renkler.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler().beyaz,
      appBar: AppBar(
          backgroundColor: Renkler().yesil,
          title: Text(
            'Profile',
            style: GoogleFonts.bungee(),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: EkranBoyut.yukseklik(context, 0.3),
              width: EkranBoyut.genislik(context, 0.7),
              child: Image.network(
                  "https://blog.hostingdunyam.com.tr/wp-content/uploads/2023/03/flutter-nedir-768x768.jpg"),
            ),
            Text(
              "Kullanıcı Adı",
              style: GoogleFonts.bungee(
                  fontSize: EkranBoyut.yukseklik(context, 0.02)),
            ),
            Text(
              "Yemek Puanı",
              style: GoogleFonts.bungee(
                  fontSize: EkranBoyut.yukseklik(context, 0.02)),
            ),
          ],
        ),
      ),
    );
  }
}
