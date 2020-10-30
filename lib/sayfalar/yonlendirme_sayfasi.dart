

import 'package:flutter/material.dart';
import 'package:fluttergtalk/sayfalar/ana_sayfa.dart';
import 'package:fluttergtalk/sayfalar/giris_sayfasi.dart';
import 'package:fluttergtalk/viewmodels/user_view_model.dart';
import 'package:provider/provider.dart';

class YonlendirmeSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userModel=Provider.of<UserViewModel>(context,listen: true);
    if(_userModel.state==ViewState.Idle){
      if(_userModel.user==null) {
        return GirisSayfasi();
      }else{
        return AnaSayfa(user: _userModel.user);
      }
    }else{
      return Scaffold(
        body: Center(child: CircularProgressIndicator(),),
      );
    }
  }
}
