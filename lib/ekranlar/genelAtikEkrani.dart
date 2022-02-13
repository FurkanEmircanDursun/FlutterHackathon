import 'package:atik_yonetim/ekranlar/atikBildirimiEkrani.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class GenelAtikEkrani extends StatefulWidget {
  @override
  State<GenelAtikEkrani> createState() => _GenelAtikEkraniState();
}

class _GenelAtikEkraniState extends State<GenelAtikEkrani> {
  final List<String> entries = <String>[
    'Durum : Beklemede',
    'Durum : Beklemede',
    'Durum : Tamamlandı',
    'Durum : Beklemede',
    'Durum : Beklemede',
    'Durum : Tamamlandı',
    'Durum : Beklemede',
    'Durum : Beklemede',
    'Durum : Tamamlandı'
  ];
  final List<String> bilgiler = <String>[
    '1 kilo pil atık,1 kilo plastik atık',
    '2 kilo kağıt atık,1 kilo pil atık,1 kilo kağıt atık',
    '2 kilo elektronik atık,2 kilo pil atık',
    '1 kilo pil atık',
    '2 kilo kağıt atık',
    '2 kilo elektronik atık',
    '1 kilo pil atık',
    '2 kilo kağıt atık',
    '2 kilo elektronik atık'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: SizedBox()),
        Expanded(
          flex: 20,
          child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: entries[index] == "Durum : Beklemede"
                      ? Colors.yellow
                      : Colors.green[200],
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        final splitted = bilgiler[index].split(',');
                        String yazdiralacakMesaj = "";
                        if (entries[index] == "Durum : Beklemede") {
                          for (int i = 0; i < splitted.length; i++) {
                            yazdiralacakMesaj +=
                                "${splitted[i]} doğaya kazandırmak üzeresiniz !\n\n ";
                          }
                        }
                        if (entries[index] != "Durum : Beklemede") {
                          for (int i = 0; i < splitted.length; i++) {
                            yazdiralacakMesaj +=
                                "${splitted[i]} doğaya kazandırdınız !\n\n ";
                          }
                        }

                        AwesomeDialog(
                          context: context,
                          dialogType: entries[index] != "Durum : Beklemede"
                              ? DialogType.SUCCES
                              : DialogType.INFO,
                          headerAnimationLoop: false,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Gönderim Tarihi : 23/12/2021\nSaat : 14:44',
                          desc: yazdiralacakMesaj,
                          buttonsTextStyle: TextStyle(color: Colors.black),
                          showCloseIcon: true,
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {},
                        )..show();
                      },
                      child: Container(
                          height: 60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(entries[index],
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                              Text('\nTarih : 22/12/2021',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black45)),
                            ],
                          )),
                    ),
                  ),
                );
              }),
        ),
        Expanded(
          child: SizedBox(
            height: 30,
          ),
        ),
        Expanded(
            flex: 4,
            child: LayoutBuilder(
              builder: (context, constraints) => Card(
                //margin: EdgeInsetsGeometry.infinity,
                color: Colors.green,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AnaEkran()),
                    );
                  },
                  child: Container(
                    width: constraints.maxWidth - 10,
                    child: Center(
                      child: Text(
                        'Yeni Kayıt Oluştur',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ),
            )),
        Expanded(child: SizedBox())
      ],
    );
  }
}
