import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttergtalk/sayfalar/favorilerim_sayfasi.dart';
import 'package:fluttergtalk/sayfalar/ilanlarim_sayfasi.dart';
import 'package:fluttergtalk/sayfalar/profil_sayfasi.dart';


class Hesabim extends StatefulWidget {
  @override
  _HesabimState createState() => _HesabimState();
}

class _HesabimState extends State<Hesabim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hesabım"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                color: Colors.blue.shade100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                        child: Icon(Icons.create),
                    onTap: (){}, /* Fotoğraf Yüklenecek!*/
                    ),
                    Text(" Mavi Alana Profil Resmi Gelecek")
                  ],
                ),
              ),
              SizedBox(height: 5,),
              GestureDetector(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profilim())),// Sayfaya Yönlendirilecek ,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                     Container(
                        width: 40,
                        height: 50,
                        child: FittedBox(child: Icon(Icons.account_box)),
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        child: Center(child: Text("Profilim",style: TextStyle(fontSize:16),)),
                      ),
                      Container(
                        width: 145,
                      ),
                      Center(child: Icon(Icons.arrow_forward_ios)),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Ilanlarim())), // Saydaya Yönlendirilecek,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 50,
                        child: FittedBox(child: Icon(Icons.assignment)),
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        child: Center(child: Text("İlanlarım",style: TextStyle(fontSize:16),)),
                      ),
                      Container(
                        width: 145,
                      ),
                      Center(child: Icon(Icons.arrow_forward_ios)),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Favorilerim())), // Sayfaya Yönlendirilecek
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 50,
                        child: FittedBox(child: Icon(Icons.favorite)),
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        child: Center(child: Text("Favorilerim",style: TextStyle(fontSize:16),)),
                      ),
                      Container(
                        width: 145,
                      ),
                      Center(child: Icon(Icons.arrow_forward_ios)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
