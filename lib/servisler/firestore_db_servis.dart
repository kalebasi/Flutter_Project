import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttergtalk/models/ilan_model.dart';
import 'package:fluttergtalk/models/user_model.dart';
import 'package:fluttergtalk/viewmodels/user_view_model.dart';
import 'database_abstract.dart';

class FirestoreDBServis implements DBBase {
  final FirebaseFirestore _firebaseDB = FirebaseFirestore.instance;

  @override
  Future<bool> saveUser(UserModel user) async {
    DocumentSnapshot _okunanUser =
        await FirebaseFirestore.instance.doc("users/${user.userID}").get();

    if (_okunanUser.data() == null) {
      await _firebaseDB.collection("users").doc(user.userID).set(user.toMap());
      return true;
    } else {
      return true;
    }
  }

  @override
  Future<UserModel> readUser(String userID) async{
    DocumentSnapshot _okunanUser= await _firebaseDB.collection("users").doc(userID).get();
    Map<String,dynamic> _okunanUserBilgileriMap = _okunanUser.data();

    UserModel _okunanUserNesnesi =UserModel.fromMap(_okunanUserBilgileriMap);
    return _okunanUserNesnesi;
  }

  @override
  Future<bool> updateProfilPhoto(String userID, String profilPhotoURL) {
    // TODO: implement updateProfilPhoto
    throw UnimplementedError();
  }

  @override
  Future<bool> updateUserName(String userID, String yeniUserName) {
    // TODO: implement updateUserName
    throw UnimplementedError();
  }

  @override
  Future<bool> saveAdvertisement(String userID,IlanModel ilanModel) async{
    DocumentSnapshot _okunanIlan=await FirebaseFirestore.instance.doc("ilanlar/${userID}").get();

    if(_okunanIlan.data()==null){
      await _firebaseDB.collection("ilanlar").doc(userID).set(ilanModel.toMap());
      return true;
    }else{
      return true;
    }
  }

  Future<List<String>> saveGamePhotoFile(String userID, String oyunKategorisi, List<String> oyunResimleri) async{

  }

}
