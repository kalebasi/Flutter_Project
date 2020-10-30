

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttergtalk/models/user_model.dart';
import 'package:fluttergtalk/servisler/kimlik_bilgileri_abstract.dart';

class FirebaseKimlikIslemleri implements KimlikDogrulamaBilgileri{
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  @override
  Future<UserModel> currentUser() async{
    try{
      User user=_firebaseAuth.currentUser;
      return _userFromFirebase(user);
    }catch(e){
      print("Firebase Kimlik Islemleri Current Hatası:"+e.toString());
      return null;
    }
  }

  UserModel _userFromFirebase(User user) {
    if (user == null) {
      return null;
    } else {
      return UserModel(userID:user.uid,email:user.email);
    }
  }

  @override
  Future<UserModel> createUserWithEmailAndPassword(String email, String sifre) async{
    UserCredential sonuc = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: sifre);
    return _userFromFirebase(sonuc.user);
  }

  @override
  Future<UserModel> signInWithEmailAndPassword(String email, String sifre) async{
    UserCredential sonuc = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: sifre);
    return _userFromFirebase(sonuc.user);
  }

  @override
  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print("sign out hata:" + e.toString());
      return false;
    }
  }
}