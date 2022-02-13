import 'package:atik_yonetim/ekranlar/genelAtikEkrani.dart';
import 'package:atik_yonetim/ekranlar/kullaniciBilgilerEkrani.dart';
import 'package:atik_yonetim/ekranlar/kuponDonusturmeEkrani.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MyApp extends StatelessWidget {
  final String isimSoyisim;

  MyApp(this.isimSoyisim);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Icon? profilIkonu = Icon(Icons.account_circle);
  Icon? anasayfaIkonu = Icon(MdiIcons.recycle);
  Icon? kuponlarimIkonu = Icon(MdiIcons.ticket);

  int secilmisIndex = 0;
  static TextStyle tercihStili =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> sayfaGecisleri = <Widget>[
    profilSayfasi('furkan dursun'),
    GenelAtikEkrani(),
    KuponDonusturEkrani()
  ];

  void elemanaTiklaninca(int index) {
    setState(() {
      secilmisIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Atık Yönetimi Uygulaması',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: sayfaGecisleri.elementAt(secilmisIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 15,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: profilIkonu!,
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: anasayfaIkonu!,
            label: 'Dönüşüm',
          ),
          BottomNavigationBarItem(
            icon: kuponlarimIkonu!,
            label: 'Kuponlarım',
          ),
        ],
        currentIndex: secilmisIndex,
        selectedItemColor: Colors.green,
        selectedFontSize: 18,
        selectedIconTheme: IconThemeData(size: 35),
        unselectedIconTheme: IconThemeData(size: 30),
        onTap: elemanaTiklaninca,
      ),
    );
  }
}
