import 'package:atik_yonetim/yapilar/formYapilari.dart';
import 'package:flutter/material.dart';

class AnaEkran extends StatelessWidget {
  AtikTextFormField ambalajTF = AtikTextFormField(
    formFieldIsmi: "Karışık Ambalaj Atığı",
    atiginKontrolTuru: "Litre",
  );
  AtikTextFormField bitkiselTF = AtikTextFormField(
    formFieldIsmi: "Bitkisel Yağ Atığı",
    atiginKontrolTuru: "Kilogram",
  );
  AtikTextFormField pilTF = AtikTextFormField(
    formFieldIsmi: "Atık Pil Atığı",
    atiginKontrolTuru: "Kilogram",
  );

  AtikTextFormField elektronikTF = AtikTextFormField(
    formFieldIsmi: "Elektronik Atığı",
    atiginKontrolTuru: "Kilogram",
  );
  AtikTextFormField kagitTF = AtikTextFormField(
    formFieldIsmi: "Kağıt Atık",
    atiginKontrolTuru: "Kilogram",
  );
  //AtikTextFormField form6 = AtikTextFormField();

  double ambalajAtigiLitre = 0;
  double bitkiselYagAtigiKilo = 0;
  double atikPilAtigiKilo = 0;
  double elektronikAtikKilo = 0;
  double kagitAtik = 0;

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
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 30,
            ),
            child: Column(
              children: [
                Expanded(child: ambalajTF),
                Expanded(child: bitkiselTF),
                Expanded(child: pilTF),
                Expanded(child: elektronikTF),
                Expanded(child: kagitTF),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: 335.4,
                    color: Colors.green,
                    child: TextButton(
                      onPressed: () {
                        ambalajAtigiLitre = ambalajTF.icindekiDegeriDondur();
                        bitkiselYagAtigiKilo =
                            bitkiselTF.icindekiDegeriDondur();
                        atikPilAtigiKilo = pilTF.icindekiDegeriDondur();
                        elektronikAtikKilo =
                            elektronikTF.icindekiDegeriDondur();
                        kagitAtik = kagitTF.icindekiDegeriDondur();

                        print(ambalajAtigiLitre);
                        print(bitkiselYagAtigiKilo);
                        print(atikPilAtigiKilo);
                        print(elektronikAtikKilo);
                        print(kagitAtik);
                      },
                      child: Text(
                        'Oluştur',
                        style: TextStyle(color: Colors.white),
                      ),
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
