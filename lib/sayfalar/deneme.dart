import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttergtalk/ortak_widgetlar/button_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'oyunlar_sayfasi.dart';

class Deneme extends StatefulWidget {
  @override
  _DenemeState createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  String _baslik, _fiyat, _aciklama;
  String _secilenTakasDurumu = "Hayır";
  String _secilenOyunKategorisi = "Boom Beach";

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
                                  _photo==null ? _galeridenResimSec() :_photo=null;
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
                                  _photo1==null ? _galeridenResimSec() : _photo1=null;
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
                                   /* child:  GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          _photo1=null;
                                        });
                                      },
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        color: Colors.green,
                                      ),
                                    ), */
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
                                  _photo2==null ? _galeridenResimSec() : _photo2=null;
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
                                   /* child:  GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          _photo1=null;
                                        });
                                      },
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        color: Colors.green,
                                      ),
                                    ), */
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
                                  _photo3==null ? _galeridenResimSec() : _photo3=null;
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
                                            image: _photo3 == null
                                                ? NetworkImage(
                                                "https://cdn1.iconfinder.com/data/icons/linkedin-ui-glyph/48/Sed-16-512.png")
                                                : FileImage(_photo3),
                                            fit: BoxFit.cover)),
                                   /* child:  GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          _photo1=null;
                                        });
                                      },
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        color: Colors.green,
                                      ),
                                    ), */
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // buildGridView(),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.50,
                        child: Button(
                            buttonText: "İlan Ver",
                            buttonColor: Colors.orange,
                            onPressed: () {} //İlan Verecek Buton
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

  void _resmiKaldir(){
    setState(() {

    });
  }
  void _galeridenResimSec() async {
    final _yeniResim = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (_photo == null) {
        _photo = File(_yeniResim.path);
      } else if (_photo != null && _photo1 == null) {
        _photo1 = File(_yeniResim.path);
      } else if (_photo1 != null && _photo2 == null) {
        _photo2 = File(_yeniResim.path);
      } else if (_photo2 != null && _photo3 == null) {
        _photo3 = File(_yeniResim.path);
      } else if (_photo3 != null && _photo4 == null) {
        _photo4 = File(_yeniResim.path);
      } else if (_photo4 != null && _photo5 == null) {
        _photo5 = File(_yeniResim.path);
      } else if (_photo5 != null && _photo6 == null) {
        _photo6 = File(_yeniResim.path);
      } else if (_photo6 != null && _photo7 == null) {
        _photo7 = File(_yeniResim.path);
      }
    });
  }
}
