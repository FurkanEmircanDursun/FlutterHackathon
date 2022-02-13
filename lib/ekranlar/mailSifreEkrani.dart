import 'package:atik_yonetim/ekranlar/navigasyonBarEkrani.dart';
import 'package:atik_yonetim/firebasIslemleri/firebaseBaglantisi.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  double icindekiDegeriDondur() {
    return double.parse(widget.controller.text);
  }
}

class GirisYapEkrani extends StatelessWidget {
  FieldYapisi kullaniciAdiField = FieldYapisi(
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
                        Expanded(flex: 2, child: sifreField),
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            width: 335.4,
                            color: Color(0xff110F4A),
                            child: TextButton(
                              onPressed: () {
                                AuthService authService = AuthService();
                                authService.singIn(
                                    kullaniciAdiField.controller.text,
                                    sifreField.controller.text);
                                FirebaseAuth.instance
                                    .authStateChanges()
                                    .listen((User? user) {
                                  if (user == null) {
                                    print('Baaaaa');
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyApp('')),
                                    );
                                  }
                                });
                              },
                              child: Text('Giriş Yap',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            child: Text(
                              'Şifrenizi mi Unuttunuz',
                              textAlign: TextAlign.start,
                            ),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(flex: 2, child: SizedBox())
          ],
        ),
      ),
    );
  }
}
