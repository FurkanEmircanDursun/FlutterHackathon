/*
import 'package:atik_yonetim/ekranlar/mailSifreEkrani.dart';
import 'package:flutter/material.dart';

class ilkSayfa extends StatefulWidget {
  @override
  State<ilkSayfa> createState() => _ilkSayfaState();
}

class _ilkSayfaState extends State<ilkSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Geri Dönüşüm Uygulaması',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                CircleAvatar(
                  backgroundColor: Colors.lime,
                  radius: 75,
                  backgroundImage:
                      AssetImage('assets/images/geridonusumlogo.jpg'),
                ),
                SizedBox(height: 20),
                Expanded(
                  flex: 4,
                  child: Text(
                    ''' 
Bir atık daha ne kadar
değerli olabilir ki ''',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 25,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.green, spreadRadius: 3),
                      ],
                    ),
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: 335.4,
                    color: Color(0xff009688),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                        );
                      },
                      child: Text('Giriş Yap',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: 335.4,
                    color: Color(0xff110F4A),
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Kayıt Ol',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
