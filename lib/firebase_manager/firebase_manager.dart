import 'dart:math';
import 'dart:convert';
import 'package:music_streaming_mobile/helper/common_import.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_streaming_mobile/model/setting.dart';

String getRandString(int len) {
  var random = Random.secure();
  var values = List<int>.generate(len, (i) => random.nextInt(255));
  String randomString = base64UrlEncode(values);
  return randomString.replaceAll('=', '');
}

class FirebaseResponse {
  bool? status;
  String? message;
  Object? result;

  FirebaseResponse(this.status, this.message);
}

class FirebaseManager {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseResponse? response;
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Day dairy notes
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('radioListeners');
  CollectionReference radiosCollection =
      FirebaseFirestore.instance.collection('radios');

  CollectionReference genres = FirebaseFirestore.instance.collection('genres');
  CollectionReference homeSliders =
      FirebaseFirestore.instance.collection('radioSliders');

  CollectionReference contact =
      FirebaseFirestore.instance.collection('contact');
  CollectionReference languages =
      FirebaseFirestore.instance.collection('languages');
  CollectionReference counter =
      FirebaseFirestore.instance.collection('counter');
  CollectionReference settings =
      FirebaseFirestore.instance.collection('settings');

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> signInAnonymously() async {
    await FirebaseAuth.instance.signInAnonymously().then((userCredential) {
      if (userCredential.additionalUserInfo?.isNewUser == true) {
        insertUser(userCredential.user!.uid);
      } else {}
    });
  }

  Future<FirebaseResponse> updateUserLanguagePref(
      List<LanguageModel> languages) async {
    DocumentReference doc = userCollection.doc(auth.currentUser!.uid);

    await doc.update(
        {'languagePref': languages.map((e) => e.name).toList()}).then((value) {
      response = FirebaseResponse(true, null);
    }).catchError((error) {
      response = FirebaseResponse(false, error);
    });
    return response!;
  }

  Future<FirebaseResponse> insertUser(String id) async {
    final batch = FirebaseFirestore.instance.batch();
    DocumentReference doc = userCollection.doc(id);
    DocumentReference counterDoc = counter.doc('counter');

    batch.set(doc, {'id': id, 'status': 1});
    batch.update(counterDoc, {'radioListeners': FieldValue.increment(1)});

    await batch.commit().then((value) {
      response = FirebaseResponse(true, null);
    }).catchError((error) {
      response = FirebaseResponse(false, error);
    });
    return response!;
  }

  Future<UserModel?> getUser(String id) async {
    UserModel? user;
    await userCollection.doc(id).get().then((doc) {
      print(doc.data());
      user = UserModel.fromJson(doc.data() as Map<String, dynamic>);
    }).catchError((error) {
      print(error);
      response = FirebaseResponse(false, error);
    });

    return user;
  }

  Future<List<RadioModel>> getAllRadios({String? genreId}) async {
    List<RadioModel> list = [];

    await getIt<UserProfileManager>().refreshProfile();

    Query query = radiosCollection;

    if (getIt<UserProfileManager>().user?.prefLanguages != null) {
      query = query.where("language",
          whereIn: getIt<UserProfileManager>().user?.prefLanguages);
    }
    if (genreId != null) {
      query = query.where('genreId', isEqualTo: genreId);
    }

    await query.get().then((QuerySnapshot snapshot) {
      for (var doc in snapshot.docs) {
        list.add(RadioModel.fromJson(doc.data() as Map<String, dynamic>));
      }
    }).catchError((error) {
      response = FirebaseResponse(false, error);
    });

    return list;
  }

  Future<List<RadioModel>> getTrendingRadios({String? genreId}) async {
    List<RadioModel> list = [];

    Query query = radiosCollection.orderBy('totalListeners', descending: true);

    if (getIt<UserProfileManager>().user?.prefLanguages != null) {
      query = query.where("language",
          whereIn: getIt<UserProfileManager>().user?.prefLanguages);
    }

    if (genreId != null) {
      query = query.where('genreId', isEqualTo: genreId);
    }

    await query.get().then((QuerySnapshot snapshot) {
      for (var doc in snapshot.docs) {
        list.add(RadioModel.fromJson(doc.data() as Map<String, dynamic>));
      }
    }).catchError((error) {
      print(error);
      response = FirebaseResponse(false, error);
    });

    return list;
  }

  Future<List<RadioModel>> getFeaturedRadios({String? genreId}) async {
    List<RadioModel> list = [];

    Query query = radiosCollection.where('isFeatured', isEqualTo: 1);

    if (getIt<UserProfileManager>().user?.prefLanguages != null) {
      query = query.where("language",
          whereIn: getIt<UserProfileManager>().user?.prefLanguages);
    }

    if (genreId != null) {
      query = query.where('genreId', isEqualTo: genreId);
    }

    await query.get().then((QuerySnapshot snapshot) {
      for (var doc in snapshot.docs) {
        list.add(RadioModel.fromJson(doc.data() as Map<String, dynamic>));
      }
    }).catchError((error) {
      print(error);
      response = FirebaseResponse(false, error);
    });

    return list;
  }

  Future<List<RadioModel>> getTopSearchedRadios({String? genreId}) async {
    List<RadioModel> list = [];

    Query query = radiosCollection.orderBy('searchedCount', descending: true);

    if (getIt<UserProfileManager>().user?.prefLanguages != null) {
      query = query.where("language",
          whereIn: getIt<UserProfileManager>().user?.prefLanguages);
    }

    if (genreId != null) {
      query = query.where('genreId', isEqualTo: genreId);
    }

    print(query.parameters);

    await query.get().then((QuerySnapshot snapshot) {
      for (var doc in snapshot.docs) {
        list.add(RadioModel.fromJson(doc.data() as Map<String, dynamic>));
      }

      print(list.map((e) => e.searchCount));
    }).catchError((error) {
      print(error);

      response = FirebaseResponse(false, error);
    });

    return list;
  }

  Future<List<RadioModel>> searchRadios(String text) async {
    List<RadioModel> list = [];
    await radiosCollection
        .where("keywords", arrayContainsAny: [text])
        .get()
        .then((QuerySnapshot snapshot) {
          for (var doc in snapshot.docs) {
            list.add(RadioModel.fromJson(doc.data() as Map<String, dynamic>));
          }
        })
        .catchError((error) {
          response = FirebaseResponse(false, error);
        });

    return list;
  }

  Future<FirebaseResponse> increaseRadioSearchCount(RadioModel radio) async {
    DocumentReference radiosDoc = radiosCollection.doc(radio.id);

    await radiosDoc
        .update({'searchedCount': FieldValue.increment(1)}).then((value) {
      response = FirebaseResponse(true, null);
    }).catchError((error) {
      response = FirebaseResponse(false, error);
    });
    return response!;
  }

  Future<FirebaseResponse> increaseRadioListener(RadioModel radio) async {
    final batch = FirebaseFirestore.instance.batch();
    DocumentReference playlistDoc = radiosCollection.doc(radio.id);

    batch.update(playlistDoc, {'totalListeners': FieldValue.increment(1)});

    await batch.commit().then((value) {
      response = FirebaseResponse(true, null);
    }).catchError((error) {
      response = FirebaseResponse(false, error);
    });
    getIt<UserProfileManager>().refreshProfile();
    return response!;
  }

  Future<FirebaseResponse> likeRadio(String radioId) async {
    final batch = FirebaseFirestore.instance.batch();
    DocumentReference radioDoc = radiosCollection.doc(radioId);
    CollectionReference radioLikedBy =
        radiosCollection.doc(radioId).collection('likedBy');

    DocumentReference currentUserDoc =
        userCollection.doc(auth.currentUser!.uid); //.collection('following');

    var radioLikedByCollection = radioLikedBy.doc(auth.currentUser!.uid);

    batch.set(radioLikedByCollection, {'userId': auth.currentUser!.uid});
    batch.update(currentUserDoc, {
      'likedRadio': FieldValue.arrayUnion([radioId])
    });
    batch.update(radioDoc, {'likedByCount': FieldValue.increment(1)});

    await batch.commit().then((value) {
      response = FirebaseResponse(true, null);
    }).catchError((error) {
      response = FirebaseResponse(false, error);
    });
    return response!;
  }

  Future<FirebaseResponse> unlikeRadio(String radioId) async {
    final batch = FirebaseFirestore.instance.batch();
    DocumentReference radioDoc = radiosCollection.doc(radioId);
    CollectionReference radioLikedBy =
        radiosCollection.doc(radioId).collection('likedBy');

    DocumentReference currentUserDoc =
        userCollection.doc(auth.currentUser!.uid); //.collection('following');

    var radioLikedByCollection = radioLikedBy.doc(auth.currentUser!.uid);

    batch.delete(radioLikedByCollection);
    batch.update(currentUserDoc, {
      'likedRadio': FieldValue.arrayRemove([radioId])
    });
    batch.update(radioDoc, {'likedByCount': FieldValue.increment(-1)});

    await batch.commit().then((value) {
      response = FirebaseResponse(true, null);
    }).catchError((error) {
      response = FirebaseResponse(false, error);
    });
    return response!;
  }

  Future<bool> checkIfAlreadyLikedRadio(String radioId) async {
    bool isFollowing = false;
    CollectionReference radioLikedBy =
        radiosCollection.doc(radioId).collection('likedBy');

    await radioLikedBy
        .where('userId', isEqualTo: auth.currentUser!.uid)
        .get()
        .then((QuerySnapshot snapshot) {
      isFollowing = snapshot.docs.isNotEmpty;
    }).catchError((error) {
      response = FirebaseResponse(false, error);
    });

    return isFollowing;
  }

  Future<List<RadioModel>> getMultipleRadiosByIds(
      {required List<String> radiosId, String? genreId}) async {
    List<String> copiedRadiosId = List.from(radiosId);

    List<RadioModel> artistsList = [];

    while (copiedRadiosId.isNotEmpty) {
      List<String> firstTenArtists = [];

      if (copiedRadiosId.length > 10) {
        firstTenArtists = copiedRadiosId.sublist(0, 10);
      } else {
        firstTenArtists = copiedRadiosId.sublist(0, copiedRadiosId.length);
      }

      Query query = radiosCollection.where("id", whereIn: firstTenArtists);

      if (genreId != null) {
        query = query.where('genreId', isEqualTo: genreId);
      }

      await query.get().then((QuerySnapshot snapshot) {
        for (var doc in snapshot.docs) {
          artistsList
              .add(RadioModel.fromJson(doc.data() as Map<String, dynamic>));
        }
      }).catchError((error) {
        response = FirebaseResponse(false, error);
      });

      if (copiedRadiosId.length > 10) {
        copiedRadiosId.removeRange(0, 10);
      } else {
        copiedRadiosId.clear();
      }
    }

    return artistsList;
  }

  Future<List<HomeSliderModel>> getAllHomeSliders() async {
    List<HomeSliderModel> list = [];

    await getIt<UserProfileManager>().refreshProfile();

    Query query = homeSliders;

    if (getIt<UserProfileManager>().user?.prefLanguages != null) {
      query = query.where("language",
          whereIn: getIt<UserProfileManager>().user?.prefLanguages);
    }

    await query.get().then((QuerySnapshot snapshot) {
      for (var doc in snapshot.docs) {
        list.add(HomeSliderModel.fromJson(doc.data() as Map<String, dynamic>));
      }
    }).catchError((error) {
      response = FirebaseResponse(false, error);
    });

    return list;
  }

  Future<FirebaseResponse> sendContactusMessage(
       String email, String subject, String message) async {
    String id = getRandString(15);
    DocumentReference doc = contact.doc(id);
    await doc.set({
      'id': id,
      // 'name': name,
      'email': email,
      'subject': subject,
      'message': message,
      'status': 1
    }).then((value) {
      response = FirebaseResponse(true, null);
    }).catchError((error) {
      response = FirebaseResponse(false, error);
    });
    return response!;
  }

  Future<List<LanguageModel>> getAllLanguages() async {
    List<LanguageModel> languagesList = [];

    await languages.get().then((QuerySnapshot snapshot) {
      for (var doc in snapshot.docs) {
        languagesList
            .add(LanguageModel.fromJson(doc.data() as Map<String, dynamic>));
      }
    }).catchError((error) {
      response = FirebaseResponse(false, error);
    });

    return languagesList;
  }

  Future<List<GenreModel>> getAllGenres() async {
    List<GenreModel> genresList = [];

    await genres
        .where('status', isEqualTo: 1)
        .get()
        .then((QuerySnapshot snapshot) {
      for (var doc in snapshot.docs) {
        genresList.add(GenreModel.fromJson(doc.data() as Map<String, dynamic>));
      }
    }).catchError((error) {
      response = FirebaseResponse(false, error);
    });

    return genresList;
  }

  Future<List<GenreModel>> searchGenres(String text) async {
    List<GenreModel> genresList = [];

    await genres
        .where("keywords", arrayContainsAny: [text])
        .get()
        .then((QuerySnapshot snapshot) {
          for (var doc in snapshot.docs) {
            genresList
                .add(GenreModel.fromJson(doc.data() as Map<String, dynamic>));
          }
        })
        .catchError((error) {
          response = FirebaseResponse(false, error);
        });

    return genresList;
  }

  Future<List<Section>> getHomePageData({String? genreId}) async {
    List<Section> sections = [];

    var responses = await Future.wait([
      getFeaturedRadios(genreId: genreId),
      getTrendingRadios(genreId: genreId),
      getTopSearchedRadios(genreId: genreId),
      getAllRadios(genreId: genreId)
    ]);

    if (responses[0].isNotEmpty) {
      sections.add(Section(
          heading: 'Featured', items: responses[0], dataType: DataType.songs));
    }
    if (responses[1].isNotEmpty) {
      sections.add(Section(
          heading: 'Trending', items: responses[1], dataType: DataType.songs));
    }
    if (responses[2].isNotEmpty) {
      sections.add(Section(
          heading: 'Top searched',
          items: responses[2],
          dataType: DataType.songs));
    }
    if (responses[3].isNotEmpty) {
      sections.add(Section(
          heading: 'All', items: responses[3], dataType: DataType.songs));
    }

    return sections;
  }

  Future<SettingsModel?> getSettings() async {
    SettingsModel? settingsModel;
    await settings.doc('settings').get().then((doc) {
      settingsModel =
          SettingsModel.fromJson(doc.data() as Map<String, dynamic>);
    }).catchError((error) {
      response = FirebaseResponse(false, error);
    });

    return settingsModel;
  }
}
