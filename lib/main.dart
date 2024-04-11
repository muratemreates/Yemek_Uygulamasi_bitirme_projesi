import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:yemek_uygulamasi_bp/models/renklr.dart';
import 'package:yemek_uygulamasi_bp/ui/views/anasayfa.dart';
import 'package:yemek_uygulamasi_bp/ui/views/detay_sayfa.dart';
import 'package:yemek_uygulamasi_bp/ui/views/sepet_sayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var sayfalar = [const Anasayfa(), const DetaySayfa(), const SepetSayfa()];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Yemek Uygulaması",
      home: Scaffold(
        body: sayfalar[index],
        bottomNavigationBar: CurvedNavigationBar(
          animationCurve: Curves.elasticInOut,
          animationDuration: Durations.extralong1,
          buttonBackgroundColor: Renkler().sari,
          height: 70,
          backgroundColor: Colors.transparent,
          color: Renkler().yesil,
          items: [
            CurvedNavigationBarItem(
              labelStyle: TextStyle(color: Renkler().beyaz),
              child: const Icon(
                Icons.home_outlined,
              ),
              label: 'Ana Sayfa',
            ),
            CurvedNavigationBarItem(
              labelStyle: TextStyle(color: Renkler().beyaz),
              child: const Icon(Icons.search),
              label: 'Search',
            ),
            CurvedNavigationBarItem(
              labelStyle: TextStyle(color: Renkler().beyaz),
              child: const Icon(
                Icons.chat_bubble_outline,
              ),
              label: 'Chat',
            ),
          ],
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
        ),
      ),
    );
  }
}
