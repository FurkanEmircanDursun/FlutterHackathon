//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:atik_yonetim/firebasIslemleri/firebaseBaglantisi.dart';
import 'package:atik_yonetim/main.dart';
import 'package:flutter/material.dart';

class FieldYapisi extends StatefulWidget {
  TextEditingController controller = TextEditingController(text: '');
  String? formFieldIsmi;
  String? fieldIsmi;
  bool? gizleme;
  Icon? fieldIconu;
  FieldYapisi(
      {this.formFieldIsmi, this.fieldIsmi, this.gizleme, this.fieldIconu});

  @override
  State<FieldYapisi> createState() => _FieldYapisiState();
}

class _FieldYapisiState extends State<FieldYapisi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.gizleme!,
        style: TextStyle(color: Colors.blueAccent),
        decoration: InputDecoration(
          labelText: widget.formFieldIsmi,
          hintText: widget.fieldIsmi,
          prefixIcon: widget.fieldIconu,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  String icindekiDegeriDondur() {
    return widget.controller.text;
  }
}

class KayitOlEkrani extends StatelessWidget {
  AuthService _authService = AuthService();
  FieldYapisi kullaniciAdiField = FieldYapisi(
    fieldIsmi: 'İsim Soyisim',
    formFieldIsmi: 'isminizi ve soyisminizi girin',
    gizleme: false,
    fieldIconu: Icon(Icons.account_circle),
  );

  FieldYapisi ePostafield = FieldYapisi(
    fieldIsmi: 'Giriş Yap',
    formFieldIsmi: 'e-mail adresinizi girin',
    gizleme: false,
    fieldIconu: Icon(Icons.local_post_office),
  );
  FieldYapisi sifreField = FieldYapisi(
    fieldIsmi: 'Şifre',
    formFieldIsmi: 'şifrenizi girin',
    gizleme: true,
    fieldIconu: Icon(Icons.fingerprint),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Atık Yönetimi Uygulaması',
          style: TextStyle(color: Colors.white),
        ),
      ),
      //backgroundColor: Colors.green,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      children: [
                        Expanded(flex: 2, child: kullaniciAdiField),
                        Expanded(flex: 2, child: ePostafield),
                        Expanded(flex: 2, child: sifreField),
                        Expanded(
                          child: TextButton(
                            child: Text(
                              'Adres Gir',
                              textAlign: TextAlign.start,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            width: 335.4,
                            color: Color(0xff110F4A),
                            child: TextButton(
                              onPressed: () {
                                String kullaniciAdi =
                                    kullaniciAdiField.controller.text;
                                String ePosta = ePostafield.controller.text;
                                String sifre = sifreField.controller.text;
                                if (kullaniciAdi != '' ||
                                    ePosta != '' ||
                                    sifre != '') {
                                  _authService.createPerson(
                                      kullaniciAdi, "Şuan yok", ePosta, sifre);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BenimUygulamam()),
                                  );
                                }
                              },
                              child: Text('Kayıt Ol',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Expanded(flex: 1, child: SizedBox())
          ],
        ),
      ),
    );
  }
}
