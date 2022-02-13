class Firma {
  String? firmaIsmi;
  Firma({this.firmaIsmi});

  String kodDondur(double kullaniciPuani) {
    double fiyat = kullaniciPuani / 10;

    return "${fiyat}firmaIsmi";
  }
}
