import 'package:fluttergtalk/models/ilan_model.dart';
import 'package:fluttergtalk/models/user_model.dart';

abstract class DBBase {

  Future<bool> saveUser(UserModel user);

  Future<UserModel> readUser(String userID);

  Future<bool> updateUserName(String userID, String yeniUserName);

  Future<bool> updateProfilPhoto(String userID, String profilPhotoURL);

  Future<bool> saveAdvertisement(String userID,IlanModel ilanModel);

 /* Future<List<UserModel>> getUserwithPagination(UserModel enSonGetirilenUser,
      int getirelecekElemanSayisi); */

 // Future<List<Konusma>> getAllConversations(String userID);

 // Stream<List<Mesaj>> getMessages(String currentUserID, String konusulanUserID);

 // Future<bool> saveMessage(Mesaj kaydedilecekMesaj);

 // Future<DateTime> saatiGoster(String userID);

}