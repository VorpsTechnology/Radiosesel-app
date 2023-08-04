import 'package:flutter/cupertino.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';

class UserProfileManager {
  final FirebaseAuth auth = FirebaseAuth.instance;

  UserModel? user;

  logout() async{
    await getIt<FirebaseManager>().logout();
  }

  refreshProfile({VoidCallback? completionHandler}) async {
    if (auth.currentUser == null) {
      User? firebaseUser = await FirebaseAuth.instance.authStateChanges().first;
      if (firebaseUser != null) {
        user = await getIt<FirebaseManager>().getUser(firebaseUser.uid);
        if (completionHandler != null) {
          completionHandler();
        }
      } else {
        await getIt<FirebaseManager>().signInAnonymously();
      }
    } else {
      user = await getIt<FirebaseManager>().getUser(auth.currentUser!.uid);
      if (completionHandler != null) {
        completionHandler();
      }
    }
  }
}
