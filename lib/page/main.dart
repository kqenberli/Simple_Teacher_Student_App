import 'package:flutter/material.dart';
import 'package:untitled2/page/mesajlar.dart';
import 'package:untitled2/repository/mesajlar_repository.dart';
import 'package:untitled2/repository/ogrenciler_repository.dart';
import 'package:untitled2/repository/ogretmenler_repository.dart';

import 'ogrenci_sayfasi.dart';
import 'ogretmenler_sayfasi.dart';

void main() {
  runApp(const OgrenciApp());
}

class OgrenciApp extends StatelessWidget {
  const OgrenciApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const MyHomePage(title: 'Student app'),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();


}
  class _MyHomePageState extends State<MyHomePage> {
    MesajlarRepository mesajlarRepository = MesajlarRepository();
    OgrencilerRepository ogrencilerRepository = OgrencilerRepository();
    OgretmenlerRepository ogretmenlerRepository = OgretmenlerRepository();

    @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Student Panel'),
            leading: const Icon(Icons.menu),
        ),

        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                child: Text('${mesajlarRepository.yeniMesajlarSayi} mesaj var'),
                onPressed: () {
                  _mesajlaraGit(context);
                },

              ),
              TextButton(
                child: Text(
                    '${ogrencilerRepository.ogrenciler.length} ogrenci'),
                onPressed: () {
                  _ogrencilereGit(context);
                },

              ),
              TextButton(
                child: Text(
                    '${ogretmenlerRepository.ogretmenler.length} ogretmen'),
                onPressed: () {
                  _ogretmenlereGit(context);
                },

              ),
            ],
          ),
        ),
      );
    }
    void  _ogrencilereGit(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return OgrencilerSayfasi(ogrencilerRepository);
      },));
    }
     void  _ogretmenlereGit(BuildContext context){
       Navigator.of(context).push(MaterialPageRoute(builder: (context){
           return OgretmenlerSayfasi(ogretmenlerRepository);
      },));

     }
      Future<void>  _mesajlaraGit(BuildContext context) async {

       await Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return MesajlarSayfasi(mesajlarRepository);
      },));

       setState(()

       {

       });

      }
  }

