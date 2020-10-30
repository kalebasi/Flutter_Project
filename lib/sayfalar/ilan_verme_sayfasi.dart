import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttergtalk/models/ilan_model.dart';
import 'package:fluttergtalk/models/user_model.dart';
import 'package:fluttergtalk/ortak_widgetlar/button_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fluttergtalk/viewmodels/advertisement_view_model.dart';
import 'package:fluttergtalk/viewmodels/user_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'oyunlar_sayfasi.dart';

class IlanVer extends StatefulWidget {
  @override
  _IlanVerState createState() => _IlanVerState();
}

class _IlanVerState extends State<IlanVer> {
  String _baslik, _fiyat, _aciklama;
  String _secilenTakasDurumu = "Hayır";
  String _secilenOyunKategorisi = "Boom Beach";
  List<String> oyunResimleri=[];
  List<String> oyunlar = [
    "Boom Beach",
    "Clash Royale",
    "Clash of Clans",
    "Castle Clash",
    "Lords Mobile",
    "World of Tanks",
    "Zula",
    "Diğer"
  ];
  final _formKey = GlobalKey<FormState>();
  File _photo, _photo1, _photo2, _photo3, _photo4, _photo5, _photo6, _photo7;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GTALK-İtem Satış Platformu"),
      ),
      body: ilanVerForm(context),
    );
  }

  Widget ilanVerForm(BuildContext context) {
   // final _ilanModel=Provider.of<AdvertisementViewModel>(context,listen:false);
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                    child: Text(
                  "İlan Verin",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'İlan Başlığı',
                        labelText: 'İlan Başlığı',
                        prefixIcon: Icon(Icons.create),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onSaved: (String girilenBaslik) {
                        _baslik = girilenBaslik;
                      },
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        Text(
                          "Oyun Kategorisi :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: Colors.grey.shade500,
                                  style: BorderStyle.solid,
                                  width: 0.80)),
                          child: Center(
                            child: DropdownButton<String>(
                              items: oyunlar.map((oAnkiOyun) {
                                return DropdownMenuItem<String>(
                                  child: Text(oAnkiOyun),
                                  value: oAnkiOyun,
                                );
                              }).toList(),
                              onChanged: (String secilenOyun) {
                                setState(() {
                                  _secilenOyunKategorisi = secilenOyun;
                                });
                              },
                              hint: Text("Seciniz"),
                              value: _secilenOyunKategorisi,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Takas Durumu :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: Colors.grey.shade500,
                                  style: BorderStyle.solid,
                                  width: 0.80)),
                          child: Center(
                            child: DropdownButton<String>(
                              items: [
                                DropdownMenuItem(
                                  child: Text(
                                    "Hayır",
                                  ),
                                  value: "Hayır",
                                ),
                                DropdownMenuItem(
                                  child: Text("Evet"),
                                  value: "Evet",
                                ),
                              ],
                              onChanged: (String secilen) {
                                setState(() {
                                  _secilenTakasDurumu = secilen;
                                });
                              },
                              hint: Text("Seciniz"),
                              value: _secilenTakasDurumu,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Fiyat',
                        labelText: 'Fiyat',
                        prefixIcon: Icon(Icons.monetization_on),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onSaved: (String girilenFiyat) {
                        _fiyat= girilenFiyat;
                      },
                    ),
                    SizedBox(height: 8),
                    Container(
                      child: TextFormField(
                        maxLines: 5,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Açıklama',
                          labelText: 'Açıklama',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onSaved: (String girilenAciklama) {
                          _aciklama = girilenAciklama;
                        },
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Fotoğraf Ekleyiniz >",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 12,
                          fontStyle: FontStyle.italic),
                    ),
                    //Burası Duruma Göre ayarlanacak...
                    Container(
                      height: 100,
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if(_photo==null){
                                    _galeridenResimSec();
                                  }else{
                                    oyunResimleri.remove(_photo.toString());
                                    _photo=null;
                                  }
                                 // _photo==null ? _galeridenResimSec() :_photo=null;
                                });
                              },
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(12),
                                padding: EdgeInsets.all(1),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  child: Container(
                                    width: 120,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: _photo == null
                                                ? NetworkImage(
                                                    "https://cdn1.iconfinder.com/data/icons/linkedin-ui-glyph/48/Sed-16-512.png")
                                                : FileImage(_photo),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if(_photo1==null){
                                    _galeridenResimSec();
                                  }else{
                                    oyunResimleri.remove(_photo1.toString());
                                    _photo1=null;
                                  }
                                  // _photo==null ? _galeridenResimSec() :_photo=null;
                                });
                              },
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(12),
                                padding: EdgeInsets.all(1),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  child: Container(
                                    width: 120,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: _photo1 == null
                                                ? NetworkImage(
                                                    "https://cdn1.iconfinder.com/data/icons/linkedin-ui-glyph/48/Sed-16-512.png")
                                                : FileImage(_photo1),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if(_photo2==null){
                                    _galeridenResimSec();
                                  }else{
                                    oyunResimleri.remove(_photo2.toString());
                                    _photo2=null;
                                  }
                                  // _photo==null ? _galeridenResimSec() :_photo=null;
                                });
                              },
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(12),
                                padding: EdgeInsets.all(1),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  child: Container(
                                    width: 120,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: _photo2 == null
                                                ? NetworkImage(
                                                    "https://cdn1.iconfinder.com/data/icons/linkedin-ui-glyph/48/Sed-16-512.png")
                                                : FileImage(_photo2),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if(_photo3==null){
                                    _galeridenResimSec();
                                  }else{
                                    oyunResimleri.remove(_photo3.toString());
                                    _photo3=null;
                                  }
                                  // _photo==null ? _galeridenResimSec() :_photo=null;
                                });
                              },
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(12),
                                padding: EdgeInsets.all(1),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  child: Container(
                                    width: 120,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: _photo3== null
                                                ? NetworkImage(
                                                    "https://cdn1.iconfinder.com/data/icons/linkedin-ui-glyph/48/Sed-16-512.png")
                                                : FileImage(_photo3),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if(_photo4==null){
                                    _galeridenResimSec();
                                  }else{
                                    oyunResimleri.remove(_photo4.toString());
                                    _photo4=null;
                                  }
                                  // _photo==null ? _galeridenResimSec() :_photo=null;
                                });
                              },
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(12),
                                padding: EdgeInsets.all(1),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  child: Container(
                                    width: 120,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: _photo4== null
                                                ? NetworkImage(
                                                    "https://cdn1.iconfinder.com/data/icons/linkedin-ui-glyph/48/Sed-16-512.png")
                                                : FileImage(_photo4),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if(_photo5==null){
                                    _galeridenResimSec();
                                  }else{
                                    oyunResimleri.remove(_photo5.toString());
                                    _photo5=null;
                                  }
                                  // _photo==null ? _galeridenResimSec() :_photo=null;
                                });
                              },
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(12),
                                padding: EdgeInsets.all(1),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  child: Container(
                                    width: 120,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: _photo5== null
                                                ? NetworkImage(
                                                    "https://cdn1.iconfinder.com/data/icons/linkedin-ui-glyph/48/Sed-16-512.png")
                                                : FileImage(_photo5),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if(_photo6==null){
                                    _galeridenResimSec();
                                  }else{
                                    oyunResimleri.remove(_photo6.toString());
                                    _photo6=null;
                                  }
                                  // _photo==null ? _galeridenResimSec() :_photo=null;
                                });
                              },
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(12),
                                padding: EdgeInsets.all(1),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  child: Container(
                                    width: 120,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: _photo6== null
                                                ? NetworkImage(
                                                    "https://cdn1.iconfinder.com/data/icons/linkedin-ui-glyph/48/Sed-16-512.png")
                                                : FileImage(_photo6),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if(_photo7==null){
                                    _galeridenResimSec();
                                  }else{
                                    oyunResimleri.remove(_photo7.toString());
                                    _photo7=null;
                                  }
                                  // _photo==null ? _galeridenResimSec() :_photo=null;
                                });
                              },
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(12),
                                padding: EdgeInsets.all(1),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  child: Container(
                                    width: 120,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: _photo7== null
                                                ? NetworkImage(
                                                    "https://cdn1.iconfinder.com/data/icons/linkedin-ui-glyph/48/Sed-16-512.png")
                                                : FileImage(_photo7),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.50,
                        child: Button(
                          buttonText: "İlan Ver",
                          buttonColor: Colors.orange,
                          onPressed: () =>_formIlanVer(context), //İlan Verecek Buton
                        ),
                      ),
                    ),Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.50,
                        child: Button(
                          buttonText: "İlan Yazdir",
                          buttonColor: Colors.orange,
                          onPressed: () =>_formIlanYazdir(context), //İlan Verecek Buton
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _galeridenResimSec() async {
    final _yeniResim = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (_photo == null) {
        _photo = File(_yeniResim.path);
         print(_photo);
        oyunResimleri.add(_photo.toString());
      } else if (_photo != null && _photo1 == null) {
        _photo1 = File(_yeniResim.path);
        print(_photo1);
        oyunResimleri.add(_photo1.toString());
      } else if (_photo1 != null && _photo2 == null) {
        _photo2 = File(_yeniResim.path);
        print(_photo2);
        oyunResimleri.add(_photo2.toString());
      } else if (_photo2 != null && _photo3 == null) {
        _photo3 = File(_yeniResim.path);
        print(_photo3);
        oyunResimleri.add(_photo3.toString());
      } else if (_photo3 != null && _photo4 == null) {
        _photo4 = File(_yeniResim.path);
        print(_photo4);
        oyunResimleri.add(_photo4.toString());
      } else if (_photo4 != null && _photo5 == null) {
        _photo5 = File(_yeniResim.path);
        print(_photo5);
        oyunResimleri.add(_photo5.toString());
      } else if (_photo5 != null && _photo6 == null) {
        _photo6 = File(_yeniResim.path);
        print(_photo6);
        oyunResimleri.add(_photo6.toString());
      } else if (_photo6 != null && _photo7 == null) {
        _photo7 = File(_yeniResim.path);
        print(_photo7);
        oyunResimleri.add(_photo7.toString());
      }
    });
  }

  void _formIlanVer(BuildContext context) async {
    _formKey.currentState.save();
    final _ilanModel=Provider.of<AdvertisementViewModel>(context,listen:false);
    if (_baslik!=null && _fiyat!=null) {

      var result= await _ilanModel.saveAdvertisement(_ilanModel.user.userID,_ilanModel.ilan);
      if(result==true){
        var url=await _ilanModel.saveGamePhotoFile(_ilanModel.user.userID,_ilanModel.ilan.oyunKategorisi,oyunResimleri);
        print(url);
      }

      /* if (url != null) {
        PlatformDuyarliAlertDialog(
          baslik: "Başarılı",
          icerik: "Profil fotoğrafınız güncellendi",
          anaButonYazisi: 'Tamam',
        ).goster(context);
      }  */
    }else{
      print("HATA");
    }
  }

  void _formIlanYazdir(BuildContext context) async {
    _formKey.currentState.save();
    final _ilanModel=Provider.of<AdvertisementViewModel>(context,listen:false);
    print(_baslik);
    print(_secilenOyunKategorisi);
    print(_secilenTakasDurumu);
    print(_fiyat);
    print(_aciklama);

    print("*********************************");

    _ilanModel.ilan.ilanBasligi=_baslik;
    var baslik=_ilanModel.ilan.ilanBasligi;

    _ilanModel.ilan.oyunKategorisi=_secilenOyunKategorisi;
    var oyun=_ilanModel.ilan.oyunKategorisi;

    _ilanModel.ilan.takasDurumu=_secilenTakasDurumu;
    var takas=_ilanModel.ilan.takasDurumu;

    _ilanModel.ilan.fiyat=_fiyat;
    var fiyat=_ilanModel.ilan.fiyat;

    _ilanModel.ilan.aciklama=_aciklama;
    var aciklama=_ilanModel.ilan.aciklama;

    print(baslik);
    print(oyun);
    print(takas);
    print(fiyat);
    print(aciklama);

  }


}
