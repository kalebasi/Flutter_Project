
import 'package:flutter/material.dart';
import 'package:fluttergtalk/models/ilan_model.dart';
import 'package:fluttergtalk/models/user_model.dart';
import 'package:fluttergtalk/repository/user_repository.dart';
import 'package:fluttergtalk/locator.dart';

enum AdvertisementViewState {Idle,Loaded,Busy}

class AdvertisementViewModel with ChangeNotifier {
  AdvertisementViewState _state = AdvertisementViewState.Idle;
  UserRepository _userRepository = getIt<UserRepository>();

  UserModel _user;
  UserModel get user => _user;

  IlanModel _ilan;
  IlanModel get ilan=> _ilan;
  set ilan(IlanModel value) {
    _ilan = value;
  }


  AdvertisementViewState get state => _state;

  set state(AdvertisementViewState value) {
    _state = value;
    notifyListeners();
  }

  Future<bool> saveAdvertisement(String userID, IlanModel ilanModel) async {
    return await _userRepository.saveAdvertisement(userID,ilanModel);
  }

  Future<List<String>>saveGamePhotoFile(String userID, String oyunKategorisi, List<String> oyunResimleri) async{
    var _indirmeLinki=await _userRepository.saveGamePhotoFile(userID,oyunKategorisi,oyunResimleri);
    return _indirmeLinki;
  }
}
