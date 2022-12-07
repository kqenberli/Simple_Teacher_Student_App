class OgrencilerRepository{

final List<Ogrenci> ogrenciler = [
    Ogrenci('jesse', 'Pickman', 18 , 'man'),
   Ogrenci('Marie', 'Screder', 20, 'woman'),

 ];
   final Set<Ogrenci> sevdiklerim = {};
  void sev(Ogrenci ogrenci, bool seviyorMuyum) {
    if(seviyorMuyum){
      sevdiklerim.add(ogrenci);

    }
    else {
      sevdiklerim.remove(ogrenci);
    }
  }

   bool seviyourMuyum(Ogrenci ogrenci) {
     return sevdiklerim.contains(ogrenci);
   }

}
class Ogrenci {
  String ad;
  String soyad;


  int yas;
    String cinsiyet;
  Ogrenci(this.ad, this.soyad, this.yas, this.cinsiyet);

}
