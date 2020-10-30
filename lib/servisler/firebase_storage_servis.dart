

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttergtalk/servisler/storage_base.dart';

class FirebaseStorageService implements StorageBase{
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  StorageReference _storageReference;

  @override
  Future<List<String>> saveGamePhotoFile(String userID, String oyunKategorisi, List<String> oyunResimleri) async{
    oyunResimleri.forEach((oAnkiResim) {
     _storageReference.child(userID).child(oyunKategorisi).child(oAnkiResim);
    });


    /* _storageReference=_firebaseStorage
        .ref()
        .child(userID)
        .child(oyunKategorisi)
        .child(oyunResimleri[0]); */

  }



}