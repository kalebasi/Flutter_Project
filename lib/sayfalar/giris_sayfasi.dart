import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttergtalk/models/user_model.dart';
import 'package:fluttergtalk/ortak_widgetlar/alert_dialog_widget.dart';
import 'package:fluttergtalk/ortak_widgetlar/button_widget.dart';
import 'package:fluttergtalk/sayfalar/hatalar.dart';
import 'package:fluttergtalk/viewmodels/user_view_model.dart';
import 'package:provider/provider.dart';


enum GirisDurumu{Kayit,Giris}

class GirisSayfasi extends StatefulWidget {
  @override
  _GirisSayfasiState createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  String _email,_sifre;
  String _buttonText,_linkText;

  var _girisDurumu=GirisDurumu.Giris;

  final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _buttonText=_girisDurumu==GirisDurumu.Giris ? "Giriş Yap":"Kayıt Ol";
    _linkText=_girisDurumu==GirisDurumu.Giris ? "Hesabınız Yok Mu?Kayıt Olun" :"Hesabınız Var Mı? Giriş Yapın";

    return Scaffold(
      appBar:AppBar(
        title:Center(child: Text("Giriş / Kayıt")),
        elevation: 0,
      ),
      backgroundColor:Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text("Oturum Açın",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32),),
              SizedBox(height: 8,),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: _girisDurumu==GirisDurumu.Giris ? 'Email Adresiniz':'Email Adres Giriniz.',
                  labelText: _girisDurumu==GirisDurumu.Giris ? 'Email Adresiniz':'Email Adresi Giriniz.',
                  prefixIcon: Icon(Icons.email) ,
                  border: OutlineInputBorder(),
                ),
                onSaved: (String girilenEmail){
                  _email=girilenEmail;
                },
              ),
              SizedBox(height: 8),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: _girisDurumu==GirisDurumu.Giris ? 'Şifreniz': 'Şifrenizi Oluşturunuz.',
                  labelText: _girisDurumu==GirisDurumu.Giris ? 'Şifreniz': 'Şifrenizi Oluşturunuz.',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                onSaved: (String girilenSifre){
                  _sifre=girilenSifre;
                },
              ),
              SizedBox(height: 8,),
              Button(
                buttonText: _buttonText,
                buttonColor: Theme.of(context).primaryColor,
                radius: 10,
                onPressed: () =>_formuGonder(),
              ),
              SizedBox(height: 10,),
              FlatButton(
                onPressed: ()=> _durumDegistir(),
                child: Text(_linkText),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _durumDegistir() {
    setState(() {
      _girisDurumu=_girisDurumu==GirisDurumu.Giris ? GirisDurumu.Kayit : GirisDurumu.Giris;
    });
  }


  void _formuGonder() async{
    _formKey.currentState.save();

    final _userModel = Provider.of<UserViewModel>(context,listen: false);

    if (_girisDurumu ==GirisDurumu.Giris) {
      try {
        UserModel _girisYapanUser = await _userModel.signInWithEmailAndPassword(_email, _sifre);
        //if (_girisYapanUser != null)
        //print("Oturum açan user id:" + _girisYapanUser.userID.toString());
      } on PlatformException catch (e) {
        PlatformDuyarliAlertDialog(
          baslik: "Oturum Açma HATA",
          icerik: Hatalar.goster(e.code),
          anaButonYazisi: 'Tamam',
        ).goster(context);
      }
    } else {
      try {
        UserModel _olusturulanUser =
        await _userModel.createUserWithEmailAndPassword(_email, _sifre);
        /* if (_olusturulanUser != null)
          print("Oturum açan user id:" + _olusturulanUser.userID.toString());*/
      } on PlatformException catch (e) {
        PlatformDuyarliAlertDialog(
          baslik: "Kullanıcı Oluşturma HATA",
          icerik: Hatalar.goster(e.code),
          anaButonYazisi: 'Tamam',
        ).goster(context);
      }
    }
  }
}
