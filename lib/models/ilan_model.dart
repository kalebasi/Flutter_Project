
import 'package:flutter/material.dart';

class IlanModel{
 // final String userID;
  String ilanBasligi;
  String oyunKategorisi;
  String takasDurumu;
  String fiyat;
  String aciklama;

  IlanModel({@required this.ilanBasligi,@required this.fiyat});


  Map<String, dynamic> toMap() {
    return {
    //  'userID': userID,
      'ilanBasligi': ilanBasligi,
      'oyunKategorisi': oyunKategorisi,
      'takasDurumu': takasDurumu,
      'fiyat':fiyat,
      'aciklama':aciklama,
    };
  }

  IlanModel.fromMap(Map<String,dynamic> map)
      : //userID = map['userID'],
        ilanBasligi = map['ilanBasligi'],
        oyunKategorisi = map['oyunKategorisi'],
        takasDurumu = map['takasDurumu'],
        fiyat = map['fiyat'],
        aciklama = map['aciklama'];


}