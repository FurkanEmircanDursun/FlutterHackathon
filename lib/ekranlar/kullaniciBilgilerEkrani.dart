import 'package:atik_yonetim/firebasIslemleri/firebaseBaglantisi.dart';
import 'package:atik_yonetim/main.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class profilSayfasi extends StatefulWidget {
  final String isimSoyisim;
  profilSayfasi(this.isimSoyisim);
  @override
  State<profilSayfasi> createState() => _profilSayfasiState();
}

class _profilSayfasiState extends State<profilSayfasi> {
  late List<GDPData> _chartData;

  @override
  void initState() {

    _chartData = getChartData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  AuthService authService = AuthService();
                  authService.singOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BenimUygulamam()),
                  );
                },
                child: Container(
                  width: 100,
                  height: 50,
                  color: Colors.red[700],
                  child: Center(
                    child: Text(
                      'Çıkış Yap',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.lime,
              radius: 75,
              backgroundImage: AssetImage('assets/images/faytklab.jpg'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Text(
                widget.isimSoyisim,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                color: Colors.lime,
                height: 50,
                child: Text(
                  'Dönüşüme kazandırılan atık miktarı:82',
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                color: Colors.green,
                height: 50,
                child: Text(
                  'En İyi Atık Toplama Sıralamasında #1324’inci sıradasın ',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 3,
              child: Container(
                width: width - 10,
                color: Colors.lime,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SfCartesianChart(
                        series: <ChartSeries>[
                          BarSeries<GDPData, String>(
                              dataSource: _chartData,
                              xValueMapper: (GDPData gdp, _) => gdp.continent,
                              yValueMapper: (GDPData gdp, _) => gdp.gdp)
                        ],
                        primaryXAxis: CategoryAxis(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Bitkisel Yağ', 1590),
      GDPData('Karışık Ambalaj', 1590),
      GDPData('Atık Pil', 2444),
      GDPData('Elektronik Atık', 966),
      GDPData('Kağıt Atık', 444),
    ];
    return chartData;
  }
}

class GDPData {
  final String continent;

  final double gdp;
  GDPData(this.continent, this.gdp);
}
