import 'package:flutter/material.dart';
import 'package:fluttergtalk/locator.dart';
import 'package:fluttergtalk/models/user_model.dart';
import 'package:fluttergtalk/repository/user_repository.dart';
import 'package:fluttergtalk/servisler/kimlik_bilgileri_abstract.dart';

enum ViewState { Idle, Busy }

class UserViewModel with ChangeNotifier implements KimlikDogrulamaBilgileri {
  UserRepository _userRepository = getIt<UserRepository>();
  ViewState _state = ViewState.Idle;
  UserModel _user;
  String emailHataMesaji;
  String sifreHataMesaji;


  UserModel get user => _user;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
  }

  UserViewModel(){
    currentUser();
  }


  @override
  Future<UserModel> createUserWithEmailAndPassword(String email, String sifre) async{
    if (_emailSifreKontrol(email, sifre)) {
      try {
        state = ViewState.Busy;
        _user = await _userRepository.createUserWithEmailAndPassword(email, sifre);
        return _user;
      } finally {
        state = ViewState.Idle;
      }
    } else
      return null;
  }

  @override
  Future<UserModel> currentUser() async{
    try{
      state=ViewState.Busy;
     _user= await _userRepository.currentUser();
     if(_user!=null)
       return _user;
     else return null;
    }catch(e){
      debugPrint("Viewmodeldeki currentUser hatası:"+e.toString());
    }finally{
      _state=ViewState.Idle;
    }
  }

  @override
  Future<UserModel> signInWithEmailAndPassword(String email, String sifre) async{
    try {
      if (_emailSifreKontrol(email, sifre)) {
        state = ViewState.Busy;
        _user = await _userRepository.signInWithEmailAndPassword(email, sifre);
        return _user;
      } else
        return null;
    } finally {
      state = ViewState.Idle;
    }

  }

  @override
  Future<bool> signOut() async{
    try {
      state = ViewState.Busy;
      bool sonuc = await _userRepository.signOut();
      _user = null;
      return sonuc;
    } catch (e) {
      debugPrint("User_view_modeldeki SignOut Hata:" + e.toString());
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }

  bool _emailSifreKontrol(String email, String sifre) {
    var sonuc = true;

    if (sifre.length < 6) {
      sifreHataMesaji = "En az 6 karakter olmalı";
      sonuc = false;
    } else
      sifreHataMesaji = null;
    if (_validateEmail(email)==false) {
      emailHataMesaji = "Geçersiz email adresi";
      sonuc = false;
    } else
      emailHataMesaji = null;
    return sonuc;
  }

  bool _validateEmail(String emailCheck) {
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(emailCheck);
  }


}
