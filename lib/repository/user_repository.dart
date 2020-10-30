import 'package:fluttergtalk/locator.dart';
import 'package:fluttergtalk/models/ilan_model.dart';
import 'package:fluttergtalk/models/user_model.dart';
import 'package:fluttergtalk/servisler/firebase_kimlik_servis.dart';
import 'package:fluttergtalk/servisler/firebase_storage_servis.dart';
import 'package:fluttergtalk/servisler/firestore_db_servis.dart';
import 'package:fluttergtalk/servisler/kimlik_bilgileri_abstract.dart';

class UserRepository implements KimlikDogrulamaBilgileri{
  FirebaseKimlikIslemleri _firebaseKimlikIslemleri=getIt<FirebaseKimlikIslemleri>();
  FirestoreDBServis _firestoreDBServis=getIt<FirestoreDBServis>();
  FirebaseStorageService _firebaseStorageService=getIt<FirebaseStorageService>();

  @override
  Future<UserModel> createUserWithEmailAndPassword(String email, String sifre) async{

      UserModel _user = await _firebaseKimlikIslemleri.createUserWithEmailAndPassword(email, sifre);
      return _user;
    //  bool _sonuc = await _firestoreDBService.saveUser(_user);
    //  if (_sonuc == true) {
     //   return await _firestoreDBService.readUser(_user.userID);
     // } else
     //   return null;

  }

  @override
  Future<UserModel> currentUser() async {
     UserModel  _user = await _firebaseKimlikIslemleri.currentUser();
     return _user;
    //  if (_user != null)
     //   return await _firestoreDBService.readUser(_user.userID);
     // else
      //  return null;
    }


  @override
  Future<UserModel> signInWithEmailAndPassword(String email, String sifre) async{
      UserModel _user = await _firebaseKimlikIslemleri.signInWithEmailAndPassword(email, sifre);
      return _user;
    //  return await _firestoreDBService.readUser(_user.userID);

  }

  @override
  Future<bool> signOut() async{
    return await _firebaseKimlikIslemleri.signOut();
  }

  Future<bool> saveAdvertisement(String userID, IlanModel ilanModel) async{
    var _result=await _firestoreDBServis.saveAdvertisement(userID, ilanModel);
    return _result;
  }

  Future<List<String>>saveGamePhotoFile(String userID, String oyunKategorisi, List<String> oyunResimleri) async{
   List<String> _gamePhoto= await _firebaseStorageService.saveGamePhotoFile(userID, oyunKategorisi, oyunResimleri);
   return _gamePhoto;
  }

}