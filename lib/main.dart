import 'package:flutter/material.dart';
import 'package:fluttergtalk/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttergtalk/sayfalar/ana_sayfa.dart';
import 'package:fluttergtalk/sayfalar/yonlendirme_sayfasi.dart';
import 'package:fluttergtalk/sayfalar/deneme.dart';
import 'package:fluttergtalk/viewmodels/advertisement_view_model.dart';
import 'package:fluttergtalk/viewmodels/user_view_model.dart';
import 'package:provider/provider.dart';

import 'sayfalar/giris_sayfasi.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  setupGetIt();
  runApp(MyApp());
  
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserViewModel>(create: (context)=>UserViewModel()),
        ChangeNotifierProvider<AdvertisementViewModel>(create: (context)=>AdvertisementViewModel()),
      ],
      child: MaterialApp(
        title: 'Hesap Satış Platformu',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
       home: AnaSayfa(), //yonlendirme_sayfasina yonlenirilecek...
      ),
    );
  }
}
