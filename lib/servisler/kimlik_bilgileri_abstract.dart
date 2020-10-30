import 'package:fluttergtalk/models/user_model.dart';

 abstract class KimlikDogrulamaBilgileri {

  Future<UserModel> currentUser();
  Future<bool> signOut();
  Future<UserModel> signInWithEmailAndPassword(String email,String sifre);
  Future<UserModel> createUserWithEmailAndPassword(String email,String sifre);

}