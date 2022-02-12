import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

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
    Text(
      'Profil',
      style: tercihStili,
    ),
    Text(
      'AnaEkran',
      style: tercihStili,
    ),
    Text(
      'Kuponlarım',
      style: tercihStili,
    ),
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
        unselectedFontSize: 20,
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
