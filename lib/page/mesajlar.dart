import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/repository/mesajlar_repository.dart';
class MesajlarSayfasi extends StatefulWidget{
  final MesajlarRepository mesajlarRepository;
  const MesajlarSayfasi(this.mesajlarRepository, {Key?  key}) : super(key: key);
  @override
  _MesajlarSayfasiState createState() => _MesajlarSayfasiState();
}
class _MesajlarSayfasiState extends State<MesajlarSayfasi>{
   void initState(){
    widget.mesajlarRepository.yeniMesajlarSayi = 0;
     super.initState();
   }


  @override
  Widget build(BuildContext  context){

    return Scaffold(
      appBar: AppBar(title: const Text('mesajlar'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
               itemCount: widget.mesajlarRepository.mesajlar.length,
                itemBuilder: (context, index) {

                  return  MesajGorunumu(
                      widget.mesajlarRepository.mesajlar[widget.mesajlarRepository.mesajlar.length-index-1],
                  );
                },
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(25.0)
                          )
                        ),
                          child:  Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child:  const TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),

                          )
                      ),
                    )
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: ElevatedButton(
                      onPressed: () {
                        print('gonder');
                      },
                      child: const Text('gonder')
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }

}

class MesajGorunumu extends StatelessWidget {
  final Mesaj mesaj;
  const MesajGorunumu(this.mesaj, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: mesaj.gonderen =='Ali' ? Alignment.centerRight: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color : Colors.black,width: 2),
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.all(const Radius.circular(15)),
          ),
          child:  Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(mesaj.yazi),
          ),

        ),
      ),
    );
  }
}