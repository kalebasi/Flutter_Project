import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttergtalk/models/user_model.dart';
import 'package:fluttergtalk/sayfalar/hesabim_sayfasi.dart';
import 'package:fluttergtalk/sayfalar/ilan_bottom_navi.dart';
import 'package:fluttergtalk/sayfalar/ilan_verme_sayfasi.dart';
import 'package:fluttergtalk/sayfalar/mesajlar_sayfasi.dart';
import 'package:fluttergtalk/sayfalar/oyunlar_sayfasi.dart';

class AnaSayfa extends StatefulWidget {
  final UserModel user;

  AnaSayfa({Key key, @required this.user}) : super(key: key);

  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text("GTALK - Hesap Satış Platformu",style: TextStyle(fontSize: 18),)),
      ),
      drawer: _drawerList(),
      body: _ilanlarListesi(),
    );
  }

  _drawerList() {
    return Drawer(
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Resim Gelecek',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Ana Sayfa'),
          ),
          ListTile(
            leading: Icon(Icons.menu),
            title: Text('İlanlar'),
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>AnaSayfa())),
          ),
          ListTile(
            leading: Icon(Icons.gamepad),
            title: Text('Oyunlar'),
            onTap: () =>Navigator.push(context,MaterialPageRoute(builder: (context)=>Oyunlar())),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Mesajlar'),
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MesajlarSayfasi())),
          ),
          ListTile(
            onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>IlanVer())),
            leading: Icon(Icons.add_circle),
            title: Text('İlan Ver'),
          ),
          ListTile(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Hesabim())),
            leading: Icon(Icons.account_circle),
            title: Text('Hesabım'),
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Çıkış Yap'),
          ),
        ],
      ),
    );
  }

  _ilanlarListesi() {
    return Container(
      child: ListView.builder(
          itemCount:10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>IlanBottomNavi()));
              },
              child: Container(
                height: 105,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        color: Colors.orange.shade200,
                        width: 80,
                        height: 105,
                        child: FittedBox(
                          child: Image.asset('images/lm.jpg'),
                          fit: BoxFit.fill,),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          width: 50,
                          height: 150,
                          child: Center(
                              child: Text(
                                  "560M KUDRETLİ T5 AÇIK LORDS MOBİLE HESABI ",style: TextStyle(fontWeight: FontWeight.bold),))),
                    ),
                    Text("\$ 19.90",style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(width: 5,),
                    Center(child: Icon(Icons.arrow_forward_ios)),
                  ],
                ),
              ),
            );
          }),
    );
  }
}