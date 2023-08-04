
class SettingsModel {
  String? phone;
  String? email;
  String? facebook;
  String? twitter;
  String? aboutUs;
  String? privacyPolicy;
  String? iOSInAppPurchaseId;
  String? androidInAppPurchaseId;

  String? androidAdmobBannerId;
  String? iOSAdmobBannerId;
  String? androidAdmobInterstitailId;
  String? iOSAdmobInterstitailId;

  SettingsModel({
    this.phone,
    this.email,
    this.facebook,
    this.twitter,
    this.aboutUs,
    this.privacyPolicy,
    this.iOSInAppPurchaseId,
    this.androidInAppPurchaseId,

    this.androidAdmobBannerId,
    this.iOSAdmobBannerId,
    this.androidAdmobInterstitailId,
    this.iOSAdmobInterstitailId,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) => SettingsModel(
    phone: json["phone"],
    email: json["email"],
    facebook: json["facebook"],
    twitter: json["twitter"],
    aboutUs: json["aboutUs"],
    privacyPolicy: json["privacyPolicy"],
    iOSInAppPurchaseId: json["iOSInAppPurchaseId"],
    androidInAppPurchaseId: json["androidInAppPurchaseId"],

    androidAdmobBannerId: json["androidAdmobBannerId"],
    iOSAdmobBannerId: json["iOSAdmobBannerId"],
    androidAdmobInterstitailId: json["androidAdmobInterstitailId"],
    iOSAdmobInterstitailId: json["iOSAdmobInterstitailId"],

  );
}

