import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/repository/ogrenciler_repository.dart';

class OgrencilerSayfasi extends StatefulWidget{
 final OgrencilerRepository ogrencilerRepository;
   const OgrencilerSayfasi(this.ogrencilerRepository, {Key? key}) : super(key: key);

   @override
  _OgrencilerSayfasiState createState() =>_OgrencilerSayfasiState();

}
class _OgrencilerSayfasiState extends State<OgrencilerSayfasi>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
    appBar: AppBar(title: const Text('ogrenciler'),),
     body: Column(
       children: [
        PhysicalModel(
           color: Colors.white70,
           elevation: 10 ,
           child: Center(
             child: Padding(
               padding: const EdgeInsets.symmetric(vertical: 32.0,horizontal: 32.0),
               child: Text('${widget.ogrencilerRepository.ogrenciler.length} students'),
             ),
           ),
         ),
         Expanded(
           child: ListView.separated(
               itemBuilder: (context, index) =>  OgrenciSatiri(
                 widget.ogrencilerRepository.ogrenciler[index],
                   widget.ogrencilerRepository,
               ),
               separatorBuilder: (context , index ) =>  const Divider() ,
               itemCount: widget.ogrencilerRepository.ogrenciler.length,
           ),
         ),
       ],
     )
    );
  }

}

class OgrenciSatiri extends StatefulWidget {
  final Ogrenci ogrenci;
  final OgrencilerRepository ogrencilerRepository;
  const OgrenciSatiri(this.ogrenci,this.ogrencilerRepository , {
    Key? key,
  }) : super(key: key);

  @override
  State<OgrenciSatiri> createState() => _OgrenciSatiriState();
}

class _OgrenciSatiriState extends State<OgrenciSatiri> {
  @override
  Widget build(BuildContext context) {
    bool seviyourMuyum = widget.ogrencilerRepository.seviyourMuyum(widget.ogrenci);
    return ListTile(
         title:  Text(widget.ogrenci.ad + '  ' +widget.ogrenci.soyad),
      leading:  IntrinsicWidth(child: Center(child: Text(widget.ogrenci.cinsiyet == 'women' ?'👩️':'🧑  '))),
      trailing: IconButton(
          onPressed: () {
            setState(() {
              widget.ogrencilerRepository.sev(widget.ogrenci , !seviyourMuyum);
            });
          },
          icon:  Icon(seviyourMuyum ?  Icons.favorite :  Icons.favorite_border)
      ),
    );
  }
}