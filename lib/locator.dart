import 'package:fluttergtalk/servisler/firebase_kimlik_servis.dart';
import 'package:fluttergtalk/servisler/firebase_storage_servis.dart';
import 'package:fluttergtalk/servisler/firestore_db_servis.dart';
import 'package:get_it/get_it.dart';

import 'repository/user_repository.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton(() => UserRepository());
  getIt.registerLazySingleton(() => FirebaseKimlikIslemleri());
  getIt.registerLazySingleton(() => FirebaseStorageService());
  getIt.registerLazySingleton(() => FirestoreDBServis());
}
