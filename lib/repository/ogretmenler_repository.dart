class OgretmenlerRepository{

  List ogretmenler = [
    Ogretmen('Jesse', 'Pinckman', 18 , 'man'),
    Ogretmen('Marie', 'Scadder', 20, 'woman'),

  ];

}
class Ogretmen {
  String ad;
  String soyad;


  int yas;
  String cinsiyet;
  Ogretmen(this.ad, this.soyad, this.yas, this.cinsiyet);

}
