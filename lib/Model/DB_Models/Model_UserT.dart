const String tableUserT = 'UserT';





const exTableUserT = ''' CREATE TABLE $tableUserT (
          ${UserTFileds.userTId} TEXT PRIMARY KEY ,

${UserTFileds.globalEmail}   TEXT ,
${UserTFileds.globalPassword}   TEXT ,
${UserTFileds.globalUsername}   TEXT ,
${UserTFileds.globalQrcode}   TEXT ,
${UserTFileds.globalLink}   TEXT ,
${UserTFileds.globalEmailSignaturePath}   TEXT ,
${UserTFileds.persoPhotoPath}   TEXT ,
${UserTFileds.persoCoverPath}   TEXT ,
${UserTFileds.persoName}   TEXT ,
${UserTFileds.persoDescription}   TEXT ,
${UserTFileds.persoLocation}   TEXT ,
${UserTFileds.persoColor}   TEXT ,
${UserTFileds.persoPrivateCode}   INTEGER ,
${UserTFileds.persoIsPrivate}   INTEGER ,
${UserTFileds.persoIsShowLocation}   INTEGER ,
${UserTFileds.persoIsShowDescription}   INTEGER ,
${UserTFileds.persoQrcode}   TEXT ,
${UserTFileds.persoLink}   TEXT ,
${UserTFileds.persoEmailSignaturePath}   TEXT ,
${UserTFileds.businessPhoto}   TEXT ,
${UserTFileds.businessCover}   TEXT ,
${UserTFileds.businessFullname}   TEXT ,
${UserTFileds.businessWorkPost}   TEXT ,
${UserTFileds.businessDescription}   TEXT ,
${UserTFileds.businessEntreprise}   TEXT ,
${UserTFileds.businessEntrepriseLogo}   TEXT ,
${UserTFileds.businessServices}   TEXT ,
${UserTFileds.businessColor}   TEXT ,
${UserTFileds.businessPrivateCode}   TEXT ,
${UserTFileds.businessPhoneNumber1}   TEXT ,
${UserTFileds.businessPhoneNumber2}   TEXT ,
${UserTFileds.businessPhoneNumber3}   TEXT ,
${UserTFileds.businessPhoneNumber4}   TEXT ,
${UserTFileds.businessPhoneNumber1ype}   TEXT ,
${UserTFileds.businessPhoneNumber2ype}   TEXT ,
${UserTFileds.businessPhoneNumber3ype}   TEXT ,
${UserTFileds.businessPhoneNumber4ype}   TEXT ,
${UserTFileds.businessEmail}   TEXT ,
${UserTFileds.businessWebsite}   TEXT ,
${UserTFileds.businessIsPrivate}   INTEGER ,
${UserTFileds.businessIsShowLocation}   INTEGER ,
${UserTFileds.businessIsShowDescription}   INTEGER ,
${UserTFileds.businessQrcode}   TEXT ,
${UserTFileds.businessLink}   TEXT ,
${UserTFileds.businessEmailSignaturePath}   TEXT 
           
        ); ''';

class UserTFileds {
  static final List<String> userTValues = [
    userTId,
    globalEmail,
    globalPassword,
    globalUsername,
    globalQrcode,
    globalLink,
    globalEmailSignaturePath,
    persoPhotoPath,
    persoCoverPath,
    persoName,
    persoDescription,
    persoLocation,
    persoColor,
    persoPrivateCode,
    persoIsPrivate,
    persoIsShowLocation,
    persoIsShowDescription,
    persoQrcode,
    persoLink,
    persoEmailSignaturePath,
    businessPhoto,
    businessCover,
    businessFullname,
    businessWorkPost,
    businessDescription,
    businessEntreprise,
    businessEntrepriseLogo,
    businessServices,
    businessColor,
    businessPrivateCode,
    businessPhoneNumber1,
    businessPhoneNumber2,
    businessPhoneNumber3,
    businessPhoneNumber4,
    businessPhoneNumber1ype,
    businessPhoneNumber2ype,
    businessPhoneNumber3ype,
    businessPhoneNumber4ype,
    businessEmail,
    businessWebsite,
    businessIsPrivate,
    businessIsShowLocation,
    businessIsShowDescription,
    businessQrcode,
    businessLink,
    businessEmailSignaturePath,
  ];


  static const String userTId = "userTId";
  static const String globalEmail = "globalEmail";
  static const String globalPassword = "globalPassword";
  static const String globalUsername = "globalUsername";
  static const String globalQrcode = "globalQrcode";
  static const String globalLink = "globalLink";
  static const String globalEmailSignaturePath = "globalEmailSignaturePath";
  static const String persoPhotoPath = "persoPhotoPath";
  static const String persoCoverPath = "persoCoverPath";
  static const String persoName = "persoName";
  static const String persoDescription = "persoDescription";
  static const String persoLocation = "persoLocation";
  static const String persoColor = "persoColor";
  static const String persoPrivateCode = "persoPrivateCode";
  static const String persoIsPrivate = "persoIsPrivate";
  static const String persoIsShowLocation = "persoIsShowLocation";
  static const String persoIsShowDescription = "persoIsShowDescription";
  static const String persoQrcode = "persoQrcode";
  static const String persoLink = "persoLink";
  static const String persoEmailSignaturePath = "persoEmailSignaturePath";
  static const String businessPhoto = "businessPhoto";
  static const String businessCover = "businessCover";
  static const String businessFullname = "businessFullname";
  static const String businessWorkPost = "businessWorkPost";
  static const String businessDescription = "businessDescription";
  static const String businessEntreprise = "businessEntreprise";
  static const String businessEntrepriseLogo = "businessEntrepriseLogo";
  static const String businessServices = "businessServices";
  static const String businessColor = "businessColor";
  static const String businessPrivateCode = "businessPrivateCode";
  static const String businessPhoneNumber1 = "businessPhoneNumber1";
  static const String businessPhoneNumber2 = "businessPhoneNumber2";
  static const String businessPhoneNumber3 = "businessPhoneNumber3";
  static const String businessPhoneNumber4 = "businessPhoneNumber4";
  static const String businessPhoneNumber1ype = "businessPhoneNumber1ype";
  static const String businessPhoneNumber2ype = "businessPhoneNumber2ype";
  static const String businessPhoneNumber3ype = "businessPhoneNumber3ype";
  static const String businessPhoneNumber4ype = "businessPhoneNumber4ype";
  static const String businessEmail = "businessEmail";
  static const String businessWebsite = "businessWebsite";
  static const String businessIsPrivate = "businessIsPrivate";
  static const String businessIsShowLocation = "businessIsShowLocation";
  static const String businessIsShowDescription = "businessIsShowDescription";
  static const String businessQrcode = "businessQrcode";
  static const String businessLink = "businessLink";
  static const String businessEmailSignaturePath = "businessEmailSignaturePath";
}

class ModelUserT {
  String? userTId;
  String? globalEmail;
  String? globalPassword;
  String? globalUsername;
  String? globalQrcode;
  String? globalLink;
  String? globalEmailSignaturePath;
  String? persoPhotoPath;
  String? persoCoverPath;
  String? persoName;
  String? persoDescription;
  String? persoLocation;
  String? persoColor;
  int? persoPrivateCode;
  bool? persoIsPrivate;
  bool? persoIsShowLocation;
  bool? persoIsShowDescription;
  String? persoQrcode;
  String? persoLink;
  String? persoEmailSignaturePath;
  String? businessPhoto;
  String? businessCover;
  String? businessFullname;
  String? businessWorkPost;
  String? businessDescription;
  String? businessEntreprise;
  String? businessEntrepriseLogo;
  String? businessServices;
  String? businessColor;
  String? businessPrivateCode;
  String? businessPhoneNumber1;
  String? businessPhoneNumber2;
  String? businessPhoneNumber3;
  String? businessPhoneNumber4;
  String? businessPhoneNumber1ype;
  String? businessPhoneNumber2ype;
  String? businessPhoneNumber3ype;
  String? businessPhoneNumber4ype;
  String? businessEmail;
  String? businessWebsite;
  bool? businessIsPrivate;
  bool? businessIsShowLocation;
  bool? businessIsShowDescription;
  String? businessQrcode;
  String? businessLink;
  String? businessEmailSignaturePath;

  ModelUserT({
    this.userTId,
    this.globalEmail,
    this.globalPassword,
    this.globalUsername,
    this.globalQrcode,
    this.globalLink,
    this.globalEmailSignaturePath,
    this.persoPhotoPath,
    this.persoCoverPath,
    this.persoName,
    this.persoDescription,
    this.persoLocation,
    this.persoColor,
    this.persoPrivateCode,
    this.persoIsPrivate,
    this.persoIsShowLocation,
    this.persoIsShowDescription,
    this.persoQrcode,
    this.persoLink,
    this.persoEmailSignaturePath,
    this.businessPhoto,
    this.businessCover,
    this.businessFullname,
    this.businessWorkPost,
    this.businessDescription,
    this.businessEntreprise,
    this.businessEntrepriseLogo,
    this.businessServices,
    this.businessColor,
    this.businessPrivateCode,
    this.businessPhoneNumber1,
    this.businessPhoneNumber2,
    this.businessPhoneNumber3,
    this.businessPhoneNumber4,
    this.businessPhoneNumber1ype,
    this.businessPhoneNumber2ype,
    this.businessPhoneNumber3ype,
    this.businessPhoneNumber4ype,
    this.businessEmail,
    this.businessWebsite,
    this.businessIsPrivate,
    this.businessIsShowLocation,
    this.businessIsShowDescription,
    this.businessQrcode,
    this.businessLink,
    this.businessEmailSignaturePath,
  });

  ModelUserT copy({
    String? userTId,
    String? globalEmail,
    String? globalPassword,
    String? globalUsername,
    String? globalQrcode,
    String? globalLink,
    String? globalEmailSignaturePath,
    String? persoPhotoPath,
    String? persoCoverPath,
    String? persoName,
    String? persoDescription,
    String? persoLocation,
    String? persoColor,
    int? persoPrivateCode,
    bool? persoIsPrivate,
    bool? persoIsShowLocation,
    bool? persoIsShowDescription,
    String? persoQrcode,
    String? persoLink,
    String? persoEmailSignaturePath,
    String? businessPhoto,
    String? businessCover,
    String? businessFullname,
    String? businessWorkPost,
    String? businessDescription,
    String? businessEntreprise,
    String? businessEntrepriseLogo,
    String? businessServices,
    String? businessColor,
    String? businessPrivateCode,
    String? businessPhoneNumber1,
    String? businessPhoneNumber2,
    String? businessPhoneNumber3,
    String? businessPhoneNumber4,
    String? businessPhoneNumber1ype,
    String? businessPhoneNumber2ype,
    String? businessPhoneNumber3ype,
    String? businessPhoneNumber4ype,
    String? businessEmail,
    String? businessWebsite,
    bool? businessIsPrivate,
    bool? businessIsShowLocation,
    bool? businessIsShowDescription,
    String? businessQrcode,
    String? businessLink,
    String? businessEmailSignaturePath,
  }) =>
      ModelUserT(
        userTId: userTId ?? this.userTId,
        globalEmail: globalEmail ?? this.globalEmail,
        globalPassword: globalPassword ?? this.globalPassword,
        globalUsername: globalUsername ?? this.globalUsername,
        globalQrcode: globalQrcode ?? this.globalQrcode,
        globalLink: globalLink ?? this.globalLink,
        globalEmailSignaturePath:
            globalEmailSignaturePath ?? this.globalEmailSignaturePath,
        persoPhotoPath: persoPhotoPath ?? this.persoPhotoPath,
        persoCoverPath: persoCoverPath ?? this.persoCoverPath,
        persoName: persoName ?? this.persoName,
        persoDescription: persoDescription ?? this.persoDescription,
        persoLocation: persoLocation ?? this.persoLocation,
        persoColor: persoColor ?? this.persoColor,
        persoPrivateCode: persoPrivateCode ?? this.persoPrivateCode,
        persoIsPrivate: persoIsPrivate ?? this.persoIsPrivate,
        persoIsShowLocation: persoIsShowLocation ?? this.persoIsShowLocation,
        persoIsShowDescription:
            persoIsShowDescription ?? this.persoIsShowDescription,
        persoQrcode: persoQrcode ?? this.persoQrcode,
        persoLink: persoLink ?? this.persoLink,
        persoEmailSignaturePath:
            persoEmailSignaturePath ?? this.persoEmailSignaturePath,
        businessPhoto: businessPhoto ?? this.businessPhoto,
        businessCover: businessCover ?? this.businessCover,
        businessFullname: businessFullname ?? this.businessFullname,
        businessWorkPost: businessWorkPost ?? this.businessWorkPost,
        businessDescription: businessDescription ?? this.businessDescription,
        businessEntreprise: businessEntreprise ?? this.businessEntreprise,
        businessEntrepriseLogo:
            businessEntrepriseLogo ?? this.businessEntrepriseLogo,
        businessServices: businessServices ?? this.businessServices,
        businessColor: businessColor ?? this.businessColor,
        businessPrivateCode: businessPrivateCode ?? this.businessPrivateCode,
        businessPhoneNumber1: businessPhoneNumber1 ?? this.businessPhoneNumber1,
        businessPhoneNumber2: businessPhoneNumber2 ?? this.businessPhoneNumber2,
        businessPhoneNumber3: businessPhoneNumber3 ?? this.businessPhoneNumber3,
        businessPhoneNumber4: businessPhoneNumber4 ?? this.businessPhoneNumber4,
        businessPhoneNumber1ype:
            businessPhoneNumber1ype ?? this.businessPhoneNumber1ype,
        businessPhoneNumber2ype:
            businessPhoneNumber2ype ?? this.businessPhoneNumber2ype,
        businessPhoneNumber3ype:
            businessPhoneNumber3ype ?? this.businessPhoneNumber3ype,
        businessPhoneNumber4ype:
            businessPhoneNumber4ype ?? this.businessPhoneNumber4ype,
        businessEmail: businessEmail ?? this.businessEmail,
        businessWebsite: businessWebsite ?? this.businessWebsite,
        businessIsPrivate: businessIsPrivate ?? this.businessIsPrivate,
        businessIsShowLocation:
            businessIsShowLocation ?? this.businessIsShowLocation,
        businessIsShowDescription:
            businessIsShowDescription ?? this.businessIsShowDescription,
        businessQrcode: businessQrcode ?? this.businessQrcode,
        businessLink: businessLink ?? this.businessLink,
        businessEmailSignaturePath:
            businessEmailSignaturePath ?? this.businessEmailSignaturePath,
      );

  ModelUserT.fromJson(Map<String, dynamic> json) {
    userTId = json['userTId'];
    globalEmail = json['globalEmail'];
    globalPassword = json['globalPassword'];
    globalUsername = json['globalUsername'];
    globalQrcode = json['globalQrcode'];
    globalLink = json['globalLink'];
    globalEmailSignaturePath = json['globalEmailSignaturePath'];
    persoPhotoPath = json['persoPhotoPath'];
    persoCoverPath = json['persoCoverPath'];
    persoName = json['persoName'];
    persoDescription = json['persoDescription'];
    persoLocation = json['persoLocation'];
    persoColor = json['persoColor'];
    persoPrivateCode = json['persoPrivateCode'];
    persoIsPrivate = json['persoIsPrivate'];
    persoIsShowLocation = json['persoIsShowLocation'];
    persoIsShowDescription = json['persoIsShowDescription'];
    persoQrcode = json['persoQrcode'];
    persoLink = json['persoLink'];
    persoEmailSignaturePath = json['persoEmailSignaturePath'];
    businessPhoto = json['businessPhoto'];
    businessCover = json['businessCover'];
    businessFullname = json['businessFullname'];
    businessWorkPost = json['businessWorkPost'];
    businessDescription = json['businessDescription'];
    businessEntreprise = json['businessEntreprise'];
    businessEntrepriseLogo = json['businessEntrepriseLogo'];
    businessServices = json['businessServices'];
    businessColor = json['businessColor'];
    businessPrivateCode = json['businessPrivateCode'];
    businessPhoneNumber1 = json['businessPhoneNumber1'];
    businessPhoneNumber2 = json['businessPhoneNumber2'];
    businessPhoneNumber3 = json['businessPhoneNumber3'];
    businessPhoneNumber4 = json['businessPhoneNumber4'];
    businessPhoneNumber1ype = json['businessPhoneNumber1ype'];
    businessPhoneNumber2ype = json['businessPhoneNumber2ype'];
    businessPhoneNumber3ype = json['businessPhoneNumber3ype'];
    businessPhoneNumber4ype = json['businessPhoneNumber4ype'];
    businessEmail = json['businessEmail'];
    businessWebsite = json['businessWebsite'];
    businessIsPrivate = json['businessIsPrivate'];
    businessIsShowLocation = json['businessIsShowLocation'];
    businessIsShowDescription = json['businessIsShowDescription'];
    businessQrcode = json['businessQrcode'];
    businessLink = json['businessLink'];
    businessEmailSignaturePath = json['businessEmailSignaturePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userTId'] = userTId;
    data['globalEmail'] = globalEmail;
    data['globalPassword'] = globalPassword;
    data['globalUsername'] = globalUsername;
    data['globalQrcode'] = globalQrcode;
    data['globalLink'] = globalLink;
    data['globalEmailSignaturePath'] = globalEmailSignaturePath;
    data['persoPhotoPath'] = persoPhotoPath;
    data['persoCoverPath'] = persoCoverPath;
    data['persoName'] = persoName;
    data['persoDescription'] = persoDescription;
    data['persoLocation'] = persoLocation;
    data['persoColor'] = persoColor;
    data['persoPrivateCode'] = persoPrivateCode;
    data['persoIsPrivate'] = persoIsPrivate;
    data['persoIsShowLocation'] = persoIsShowLocation;
    data['persoIsShowDescription'] = persoIsShowDescription;
    data['persoQrcode'] = persoQrcode;
    data['persoLink'] = persoLink;
    data['persoEmailSignaturePath'] = persoEmailSignaturePath;
    data['businessPhoto'] = businessPhoto;
    data['businessCover'] = businessCover;
    data['businessFullname'] = businessFullname;
    data['businessWorkPost'] = businessWorkPost;
    data['businessDescription'] = businessDescription;
    data['businessEntreprise'] = businessEntreprise;
    data['businessEntrepriseLogo'] = businessEntrepriseLogo;
    data['businessServices'] = businessServices;
    data['businessColor'] = businessColor;
    data['businessPrivateCode'] = businessPrivateCode;
    data['businessPhoneNumber1'] = businessPhoneNumber1;
    data['businessPhoneNumber2'] = businessPhoneNumber2;
    data['businessPhoneNumber3'] = businessPhoneNumber3;
    data['businessPhoneNumber4'] = businessPhoneNumber4;
    data['businessPhoneNumber1ype'] = businessPhoneNumber1ype;
    data['businessPhoneNumber2ype'] = businessPhoneNumber2ype;
    data['businessPhoneNumber3ype'] = businessPhoneNumber3ype;
    data['businessPhoneNumber4ype'] = businessPhoneNumber4ype;
    data['businessEmail'] = businessEmail;
    data['businessWebsite'] = businessWebsite;
    data['businessIsPrivate'] = businessIsPrivate;
    data['businessIsShowLocation'] = businessIsShowLocation;
    data['businessIsShowDescription'] = businessIsShowDescription;
    data['businessQrcode'] = businessQrcode;
    data['businessLink'] = businessLink;
    data['businessEmailSignaturePath'] = businessEmailSignaturePath;

    return data;
  }

  ModelUserT.fromJsonSQFlite(Map<String, dynamic> json) {
    userTId = json['userTId'];
    globalEmail = json['globalEmail'];
    globalPassword = json['globalPassword'];
    globalUsername = json['globalUsername'];
    globalQrcode = json['globalQrcode'];
    globalLink = json['globalLink'];
    globalEmailSignaturePath = json['globalEmailSignaturePath'];
    persoPhotoPath = json['persoPhotoPath'];
    persoCoverPath = json['persoCoverPath'];
    persoName = json['persoName'];
    persoDescription = json['persoDescription'];
    persoLocation = json['persoLocation'];
    persoColor = json['persoColor'];
    persoPrivateCode = json['persoPrivateCode'];
    persoIsPrivate = json['persoIsPrivate'] ? true : false;
    persoIsShowLocation = json['persoIsShowLocation'] ? true : false;
    persoIsShowDescription = json['persoIsShowDescription'] ? true : false;
    persoQrcode = json['persoQrcode'];
    persoLink = json['persoLink'];
    persoEmailSignaturePath = json['persoEmailSignaturePath'];
    businessPhoto = json['businessPhoto'];
    businessCover = json['businessCover'];
    businessFullname = json['businessFullname'];
    businessWorkPost = json['businessWorkPost'];
    businessDescription = json['businessDescription'];
    businessEntreprise = json['businessEntreprise'];
    businessEntrepriseLogo = json['businessEntrepriseLogo'];
    businessServices = json['businessServices'];
    businessColor = json['businessColor'];
    businessPrivateCode = json['businessPrivateCode'];
    businessPhoneNumber1 = json['businessPhoneNumber1'];
    businessPhoneNumber2 = json['businessPhoneNumber2'];
    businessPhoneNumber3 = json['businessPhoneNumber3'];
    businessPhoneNumber4 = json['businessPhoneNumber4'];
    businessPhoneNumber1ype = json['businessPhoneNumber1ype'];
    businessPhoneNumber2ype = json['businessPhoneNumber2ype'];
    businessPhoneNumber3ype = json['businessPhoneNumber3ype'];
    businessPhoneNumber4ype = json['businessPhoneNumber4ype'];
    businessEmail = json['businessEmail'];
    businessWebsite = json['businessWebsite'];
    businessIsPrivate = json['businessIsPrivate'] ? true : false;
    businessIsShowLocation = json['businessIsShowLocation'] ? true : false;
    businessIsShowDescription =
        json['businessIsShowDescription'] ? true : false;
    businessQrcode = json['businessQrcode'];
    businessLink = json['businessLink'];
    businessEmailSignaturePath = json['businessEmailSignaturePath'];
  }
  Map<String, dynamic> toJsonSQFlite() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userTId'] = userTId;
    data['globalEmail'] = globalEmail;
    data['globalPassword'] = globalPassword;
    data['globalUsername'] = globalUsername;
    data['globalQrcode'] = globalQrcode;
    data['globalLink'] = globalLink;
    data['globalEmailSignaturePath'] = globalEmailSignaturePath;
    data['persoPhotoPath'] = persoPhotoPath;
    data['persoCoverPath'] = persoCoverPath;
    data['persoName'] = persoName;
    data['persoDescription'] = persoDescription;
    data['persoLocation'] = persoLocation;
    data['persoColor'] = persoColor;
    data['persoPrivateCode'] = persoPrivateCode;
    data['persoIsPrivate'] = persoIsPrivate == null || !persoIsPrivate! ? 0 : 1;
    data['persoIsShowLocation'] =
        persoIsShowLocation == null || !persoIsShowLocation! ? 0 : 1;
    data['persoIsShowDescription'] =
        persoIsShowDescription == null || !persoIsShowDescription! ? 0 : 1;
    data['persoQrcode'] = persoQrcode;
    data['persoLink'] = persoLink;
    data['persoEmailSignaturePath'] = persoEmailSignaturePath;
    data['businessPhoto'] = businessPhoto;
    data['businessCover'] = businessCover;
    data['businessFullname'] = businessFullname;
    data['businessWorkPost'] = businessWorkPost;
    data['businessDescription'] = businessDescription;
    data['businessEntreprise'] = businessEntreprise;
    data['businessEntrepriseLogo'] = businessEntrepriseLogo;
    data['businessServices'] = businessServices;
    data['businessColor'] = businessColor;
    data['businessPrivateCode'] = businessPrivateCode;
    data['businessPhoneNumber1'] = businessPhoneNumber1;
    data['businessPhoneNumber2'] = businessPhoneNumber2;
    data['businessPhoneNumber3'] = businessPhoneNumber3;
    data['businessPhoneNumber4'] = businessPhoneNumber4;
    data['businessPhoneNumber1ype'] = businessPhoneNumber1ype;
    data['businessPhoneNumber2ype'] = businessPhoneNumber2ype;
    data['businessPhoneNumber3ype'] = businessPhoneNumber3ype;
    data['businessPhoneNumber4ype'] = businessPhoneNumber4ype;
    data['businessEmail'] = businessEmail;
    data['businessWebsite'] = businessWebsite;
    data['businessIsPrivate'] =
        businessIsPrivate == null || !businessIsPrivate! ? 0 : 1;
    data['businessIsShowLocation'] =
        businessIsShowLocation == null || !businessIsShowLocation! ? 0 : 1;
    data['businessIsShowDescription'] =
        businessIsShowDescription == null || !businessIsShowDescription!
            ? 0
            : 1;
    data['businessQrcode'] = businessQrcode;
    data['businessLink'] = businessLink;
    data['businessEmailSignaturePath'] = businessEmailSignaturePath;

    return data;
  }
}
