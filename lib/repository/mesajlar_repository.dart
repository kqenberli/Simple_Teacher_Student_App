class MesajlarRepository{
  final List<Mesaj> mesajlar =  [
    Mesaj(  ' Hi', 'Walter', DateTime.now().subtract(const Duration(minutes: 3))),
    Mesaj(  ' are you here?', 'Walter', DateTime.now().subtract(const Duration(minutes: 2))),
    Mesaj(  ' yes', 'Skyler', DateTime.now().subtract(const Duration(minutes: 1))),

    Mesaj(  ' how are you', 'Skyler', DateTime.now()),
  ];

  int yeniMesajlarSayi = 4;
}
class Mesaj {
  String yazi;
  String gonderen;
  DateTime zaman;
  Mesaj(this.yazi,this.gonderen,this.zaman);


}
