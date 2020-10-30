import 'dart:io';

abstract class StorageBase {
  Future<List<String>> saveGamePhotoFile(
      String userID,
      String fileType,
      List<String> yuklenecekDosya,
      );

}