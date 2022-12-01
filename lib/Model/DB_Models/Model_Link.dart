import 'package:easy_localization/easy_localization.dart';

const String tableLinks = 'Link';

const exTableLink = ''' CREATE TABLE $tableLinks (
  
          ${LinksFileds.linkId} TEXT PRIMARY KEY  ,
          ${LinksFileds.userTId} TEXT ,
          ${LinksFileds.linkPath} TEXT ,
          ${LinksFileds.linkTypeAcc} TEXT ,
          ${LinksFileds.linkTypeName} TEXT ,
          ${LinksFileds.linkTypeIndex} TEXT ,
          ${LinksFileds.linkVisible} INTEGER  
        ); ''';

class LinksFileds {

  static final List<String> LinksValues = [
    linkId,
    userTId,
    linkPath,
    linkTypeAcc,
    linkTypeName,
    linkTypeIndex,
    linkVisible,
  ];

  static const String linkId = "linkId";
  static const String userTId = "userTId";
  static const String linkPath = "linkPath";
  static const String linkTypeAcc = "linkTypeAcc";
  static const String linkTypeName = "linkTypeName";
  static const String linkTypeIndex = "linkTypeIndex";
  static const String linkVisible = "linkVisible";

}

class ModelLink {

  String? linkId;
  String? userTId;
  String? linkPath;
  String? linkTypeAcc;
  String? linkTypeName;
  String? linkTypeIndex;
  bool? linkVisible;

  ModelLink ({
    this.linkId,
    this.userTId,
    this.linkPath,
    this.linkTypeAcc,
    this.linkTypeName,
    this.linkTypeIndex,
    this.linkVisible,
  });

  ModelLink copy({
    String? linkId,
    String? userTId,
    String? linkPath,
    String? linkTypeAcc,
    String? linkTypeName,
    String? linkTypeIndex,
    bool? linkVisible,
  }) => ModelLink(
        linkId: linkId ?? this.linkId,
        userTId: userTId ?? this.userTId,
        linkPath: linkPath ?? this.linkPath,
        linkTypeAcc: linkTypeAcc ?? this.linkTypeAcc,
        linkTypeName: linkTypeName ?? this.linkTypeName,
        linkTypeIndex: linkTypeIndex ?? this.linkTypeIndex,
        linkVisible: linkVisible ?? this.linkVisible,
      );

  ModelLink.fromJson(Map<String, dynamic> json) {
    linkId = json['linkId'];
    userTId = json['userTId'];
    linkPath = json['linkPath'];
    linkTypeAcc = json['linkTypeAcc'];
    linkTypeName = json['linkTypeName'];
    linkTypeIndex = json['linkTypeIndex'];
    linkVisible = json['linkVisible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['linkId'] = linkId;
    data['userTId'] = userTId;
    data['linkPath'] = linkPath;
    data['linkTypeAcc'] = linkTypeAcc;
    data['linkTypeName'] = linkTypeName;
    data['linkTypeIndex'] = linkTypeIndex;
    data['linkVisible'] = linkVisible;
    return data;
  }

}

class Modelforgridview{
  String? linkTypeName;
  String? linkTypeIndex;
  String? linkTypeSvG;
  String? url;
  bool personal;

  Modelforgridview({
    this.linkTypeName,
    this.linkTypeIndex,
    this.linkTypeSvG,
    this.url,
    required this.personal
  });
}


class UserDetails {
  final int linkTypeIndex;
  final String linkTypeName;

  UserDetails({required this.linkTypeIndex, required this.linkTypeName});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      linkTypeIndex: json['linkTypeIndex'],
      linkTypeName: json['linkTypeName'],
    );
  }
}




class ModelLinkInfo {
  String? linkTypeName;
  String? linkTypeIndex;
  String? linkTypeSvG;

  ModelLinkInfo({
    this.linkTypeName,
    this.linkTypeIndex,
    this.linkTypeSvG,
  });







  static List<ModelLinkInfo>  linkInfoList = [
    // ModelLinkInfo(linkTypeIndex: '0', linkTypeSvG: 'googlelogo', linkTypeName: TextStrings.Contact.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '1', linkTypeSvG: 'mail', linkTypeName: TextStrings.Email.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '2',linkTypeSvG: 'locationgoogle',linkTypeName: TextStrings.Location.tr()),
    // ModelLinkInfo(
    //   linkTypeIndex: '3',
    //   linkTypeSvG: 'phonenumber',
    //   linkTypeName: TextStrings.Phone_Number.tr(),),
    // ModelLinkInfo(
    //     linkTypeIndex: '4', linkTypeSvG: 'apple-messages', linkTypeName: TextStrings.Text.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '5', linkTypeSvG: 'whatssapp', linkTypeName:TextStrings.Whatsapp.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '6', linkTypeSvG: 'behance', linkTypeName: TextStrings.Behance.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '7', linkTypeSvG: 'dribbble', linkTypeName: TextStrings.Dribble.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '8', linkTypeSvG: 'facebook', linkTypeName: TextStrings.Facebook.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '15', linkTypeSvG: 'insta', linkTypeName: TextStrings.Instagram.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '10', linkTypeSvG: 'linkedin', linkTypeName: TextStrings.Linkedin.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '12', linkTypeSvG: 'telegram', linkTypeName: TextStrings.Telegram.tr()),
    // ModelLinkInfo( linkTypeIndex: '11', linkTypeSvG: 'pinterest', linkTypeName: TextStrings.Pinterest.tr()),
    // //munib
    // ModelLinkInfo(
    //     linkTypeIndex: '9', linkTypeSvG: 'tiktok', linkTypeName: TextStrings.Tiktok.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '14', linkTypeSvG: 'twitter', linkTypeName: TextStrings.Twitter.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '19', linkTypeSvG: 'twitch', linkTypeName: TextStrings.Twitch.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '16', linkTypeSvG: 'skype', linkTypeName: TextStrings.Skype.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '17', linkTypeSvG: 'snapchat', linkTypeName: TextStrings.Snapchat.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '18', linkTypeSvG: 'vimeo', linkTypeName: TextStrings.Vimeo.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '13', linkTypeSvG: 'youtube', linkTypeName: TextStrings.Youtube.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '20',
    //     linkTypeSvG: 'amazon-music',
    //     linkTypeName: TextStrings.Amazon_Music.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '21',
    //     linkTypeSvG: 'apple-music',
    //     linkTypeName: TextStrings.Apple_Music.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '22',
    //     linkTypeSvG: 'sound_cloud',
    //     linkTypeName: TextStrings.SoundCloud.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '23', linkTypeSvG: 'spotify', linkTypeName: TextStrings.Spotify.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '24', linkTypeSvG: 'lydia', linkTypeName: TextStrings.Lydia.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '25', linkTypeSvG: 'PayPal', linkTypeName: TextStrings.Paypal.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '26', linkTypeSvG: 'stripee', linkTypeName: TextStrings.Stripe.tr()),
    // ModelLinkInfo(
    //     linkTypeIndex: '27',
    //     linkTypeSvG: 'western_union',
    //     linkTypeName: TextStrings.Western_Union.tr()),
    // ModelLinkInfo(  linkTypeIndex: '28',
    //     linkTypeSvG: 'costumelink',
    //     linkTypeName: TextStrings.Custom_Link.tr()),
    // ModelLinkInfo(linkTypeIndex: '29',linkTypeSvG: 'ufileupload',linkTypeName: TextStrings.Upload_file.tr()),
    // ModelLinkInfo(linkTypeIndex: '30', linkTypeSvG: 'googleplay', linkTypeName: TextStrings.Add_Links.tr()),
    // ModelLinkInfo(linkTypeIndex: '31', linkTypeSvG: 'googlelogo', linkTypeName: TextStrings.Google_Reviews.tr()),
    // ModelLinkInfo(linkTypeIndex: '32', linkTypeSvG: 'open', linkTypeName: TextStrings.OpenSea.tr()),
    // ModelLinkInfo(linkTypeIndex: '33', linkTypeSvG: 'onlyfans', linkTypeName: TextStrings.OnlyFans.tr()),
    // ModelLinkInfo(linkTypeIndex: '34', linkTypeSvG: 'chrom', linkTypeName: TextStrings.Website.tr()),


    //ModelLinkInfo(linkTypeIndex: '35', linkTypeSvG: 'googlelogo', linkTypeName: TextStrings.Contact.tr()),

    ModelLinkInfo(
        linkTypeIndex: '1', linkTypeSvG: 'mail', linkTypeName: 'Email'),
    ModelLinkInfo(
        linkTypeIndex: '2',linkTypeSvG: 'locationgoogle',linkTypeName: 'Location'),
    ModelLinkInfo(
        linkTypeIndex: '3',
        linkTypeSvG: 'phonenumber',
        linkTypeName: 'Phone Number',),
    ModelLinkInfo(
        linkTypeIndex: '4', linkTypeSvG: 'apple-messages', linkTypeName: 'Text'),
    ModelLinkInfo(
        linkTypeIndex: '5', linkTypeSvG: 'whatssapp', linkTypeName: 'Whatsapp'),
    ModelLinkInfo(
        linkTypeIndex: '6', linkTypeSvG: 'behance', linkTypeName: 'Behance'),
    ModelLinkInfo(
        linkTypeIndex: '7', linkTypeSvG: 'dribbble', linkTypeName: 'Dribble'),
    ModelLinkInfo(
        linkTypeIndex: '8', linkTypeSvG: 'facebook', linkTypeName: 'Facebook'),
    ModelLinkInfo(
        linkTypeIndex: '15', linkTypeSvG: 'insta', linkTypeName: 'Instagram'),
    ModelLinkInfo(
        linkTypeIndex: '10', linkTypeSvG: 'linkedin', linkTypeName: 'Linkedin'),
    ModelLinkInfo(
        linkTypeIndex: '12', linkTypeSvG: 'telegram', linkTypeName: 'Telegram'),
    ModelLinkInfo( linkTypeIndex: '11', linkTypeSvG: 'pinterest', linkTypeName: 'Pinterest'),
    //munib
    ModelLinkInfo(
        linkTypeIndex: '9', linkTypeSvG: 'tiktok', linkTypeName: 'Tiktok'),
    ModelLinkInfo(
        linkTypeIndex: '14', linkTypeSvG: 'twitter', linkTypeName: 'Twitter'),
    ModelLinkInfo(
        linkTypeIndex: '19', linkTypeSvG: 'twitch', linkTypeName: 'Twitch'),
    ModelLinkInfo(
        linkTypeIndex: '16', linkTypeSvG: 'skype', linkTypeName: 'Skype'),
    ModelLinkInfo(
        linkTypeIndex: '17', linkTypeSvG: 'snapchat', linkTypeName: 'Snapchat'),
    ModelLinkInfo(
        linkTypeIndex: '18', linkTypeSvG: 'vimeo', linkTypeName: 'Vimeo'),
    ModelLinkInfo(
          linkTypeIndex: '13', linkTypeSvG: 'youtube', linkTypeName: 'Youtube'),
    ModelLinkInfo(
        linkTypeIndex: '20',
        linkTypeSvG: 'amazon-music',
        linkTypeName: 'Amazon Music'),
    ModelLinkInfo(
        linkTypeIndex: '21',
        linkTypeSvG: 'apple-music',
        linkTypeName: 'Apple Music'),
    ModelLinkInfo(
        linkTypeIndex: '22',
        linkTypeSvG: 'sound_cloud',
        linkTypeName: 'SoundCloud'),
    ModelLinkInfo(
        linkTypeIndex: '23', linkTypeSvG: 'spotify', linkTypeName: 'Spotify'),
    ModelLinkInfo(
        linkTypeIndex: '24', linkTypeSvG: 'lydia', linkTypeName: 'Lydia'),
    ModelLinkInfo(
        linkTypeIndex: '25', linkTypeSvG: 'PayPal', linkTypeName: 'Paypal'),
    ModelLinkInfo(
        linkTypeIndex: '26', linkTypeSvG: 'stripee', linkTypeName: 'Stripe'),
    ModelLinkInfo(
        linkTypeIndex: '27',
        linkTypeSvG: 'western_union',
        linkTypeName: 'Western Union'),
    ModelLinkInfo(  linkTypeIndex: '28',
        linkTypeSvG: 'costumelink',
        linkTypeName: 'Custom Link'),
    ModelLinkInfo(linkTypeIndex: '29',linkTypeSvG: 'ufileupload',linkTypeName: 'Upload file'),
    ModelLinkInfo(linkTypeIndex: '30', linkTypeSvG: 'googleplay', linkTypeName: 'App Link'),
    ModelLinkInfo(linkTypeIndex: '31', linkTypeSvG: 'googlelogo', linkTypeName: 'Google Reviews'),
    ModelLinkInfo(linkTypeIndex: '32', linkTypeSvG: 'open', linkTypeName: 'OpenSea'),
    ModelLinkInfo(linkTypeIndex: '33', linkTypeSvG: 'onlyfans', linkTypeName: 'OnlyFans'),
    ModelLinkInfo(linkTypeIndex: '34', linkTypeSvG: 'chrom', linkTypeName: 'Website'),
    ModelLinkInfo(linkTypeIndex: '35', linkTypeSvG: 'googlelogo', linkTypeName: 'Contact'),

  ];

}













class ModelLinkInfo1 {
  String? linkTypeName;
  String? linkTypeIndex;
  String? linkTypeSvG;
  String? url;
  bool business;
  ModelLinkInfo1({
    this.linkTypeName,
    this.linkTypeIndex,
    this.linkTypeSvG,
    this.url,
    this.business=false
  });

  static List<ModelLinkInfo1>  linkInfoList1 = [
    // ModelLinkInfo(
    //     linkTypeIndex: '1', linkTypeSvG: 'Contacts', linkTypeName: 'Contact'),
    ModelLinkInfo1(
        linkTypeIndex: '1', linkTypeSvG: 'mail', linkTypeName: 'Email',url: "",business:false),
    ModelLinkInfo1(
        linkTypeIndex: '2',linkTypeSvG: 'locationgoogle',linkTypeName: 'Location',url: "",business:false),
    ModelLinkInfo1(
      linkTypeIndex: '3',
      linkTypeSvG: 'phonenumber',
      linkTypeName: 'Phone Number',url: "",business:false),
    ModelLinkInfo1(linkTypeIndex: '4',linkTypeSvG: 'apple-messages',linkTypeName: 'Text',url: "",business:false),
    ModelLinkInfo1(
        linkTypeIndex: '5', linkTypeSvG: 'whatssapp', linkTypeName: 'Whatsapp',url: "",business:false),
    ModelLinkInfo1(
        linkTypeIndex: '6', linkTypeSvG: 'behance', linkTypeName: 'Behance',url: "",business:false),
    ModelLinkInfo1(
        linkTypeIndex: '7', linkTypeSvG: 'dribbble', linkTypeName: 'Dribble',url: "",business:false),
    ModelLinkInfo1(
        linkTypeIndex: '8', linkTypeSvG: 'facebook', linkTypeName: 'Facebook',url: "",business:false),
    ModelLinkInfo1(
        linkTypeIndex: '15', linkTypeSvG: 'insta', linkTypeName: 'Instagram',url: "",business:false),
    ModelLinkInfo1(
        linkTypeIndex: '10', linkTypeSvG: 'linkedin', linkTypeName: 'Linkedin',url: "",business:false),
    ModelLinkInfo1(
        linkTypeIndex: '12', linkTypeSvG: 'telegram', linkTypeName: 'Telegram',url: "",business:false),
    ModelLinkInfo1(linkTypeIndex: '11',linkTypeSvG: 'pinterest',linkTypeName: 'Pinterest',url: "",business:false),
    //munib
    ModelLinkInfo1(
        linkTypeIndex: '9', linkTypeSvG: 'tiktok', linkTypeName: 'Tiktok',url: "",business:false),
    ModelLinkInfo1(
        linkTypeIndex: '14', linkTypeSvG: 'twitter', linkTypeName: 'Twitter',url: "",business:false),
    ModelLinkInfo1(
        linkTypeIndex: '19', linkTypeSvG: 'twitch', linkTypeName: 'Twitch',url: "",business:false),
    ModelLinkInfo1(
        linkTypeIndex: '16', linkTypeSvG: 'skype', linkTypeName: 'Skype',url: "",business:false),
    ModelLinkInfo1(
        linkTypeIndex: '17', linkTypeSvG: 'snapchat', linkTypeName: 'Snapchat',url: "",business:false),
    ModelLinkInfo1(
        linkTypeIndex: '18', linkTypeSvG: 'vimeo', linkTypeName: 'Vimeo',url: "",business:false),
    ModelLinkInfo1(
        linkTypeIndex: '13', linkTypeSvG: 'youtube', linkTypeName: 'Youtube',url: "",business:false),
    ModelLinkInfo1(
        linkTypeIndex: '20',
        linkTypeSvG: 'amazon-music',
        linkTypeName: 'Amazon Music',url: "",business:false),
    ModelLinkInfo1(linkTypeIndex: '21',linkTypeSvG: 'apple-music',linkTypeName: 'Apple Music',url: "",business:false),
    ModelLinkInfo1(linkTypeIndex: '22', linkTypeSvG: 'sound_cloud', linkTypeName: 'SoundCloud',url: "",business:false),
    ModelLinkInfo1(linkTypeIndex: '23', linkTypeSvG: 'spotify', linkTypeName: 'Spotify',url: "",business:false),
    ModelLinkInfo1(linkTypeIndex: '24', linkTypeSvG: 'lydia', linkTypeName: 'Lydia',url: "",business:false),
    ModelLinkInfo1(linkTypeIndex: '25', linkTypeSvG: 'PayPal', linkTypeName: 'Paypal',url: "",business:false),
    ModelLinkInfo1(linkTypeIndex: '26', linkTypeSvG: 'stripee', linkTypeName: 'Stripe',url: "",business:false),
    ModelLinkInfo1(linkTypeIndex: '27', linkTypeSvG: 'western_union', linkTypeName: 'Western Union',url: "",business:false),
    ModelLinkInfo1(linkTypeIndex: '28', linkTypeSvG: 'costumelink',   linkTypeName: 'Custom Link',url: "",business:false),
    ModelLinkInfo1(linkTypeIndex: '29', linkTypeSvG: 'ufileupload',linkTypeName: 'Upload file',url: "",business:false),
    ModelLinkInfo1(linkTypeIndex: '30', linkTypeSvG: 'googleplay', linkTypeName: 'App Link',url: ""),
    ModelLinkInfo1(linkTypeIndex: '31', linkTypeSvG: 'googlelogo', linkTypeName: 'Google Reviews',url: "",business:false),
    ModelLinkInfo1(linkTypeIndex: '32', linkTypeSvG: 'open', linkTypeName: 'OpenSea',url: ""),
    ModelLinkInfo1(linkTypeIndex: '33', linkTypeSvG: 'onlyfans', linkTypeName: 'OnlyFans',url: "",business:false),
    ModelLinkInfo1(linkTypeIndex: '34', linkTypeSvG: 'chrom', linkTypeName: 'Website',url: ""),
    ModelLinkInfo1(linkTypeIndex: '35', linkTypeSvG: 'googlelogo', linkTypeName: 'Contact',url: "",business:false),
  ];
}

class ModelLinkInfo2 {
  String? linkTypeName;
  String? linkTypeIndex;
  String? linkTypeSvG;
  String? url;
  ModelLinkInfo2({
    this.linkTypeName,
    this.linkTypeIndex,
    this.linkTypeSvG,
    this.url
  });

  static List<ModelLinkInfo2>  linkInfoList2 = [
    // ModelLinkInfo(
    //     linkTypeIndex: '1', linkTypeSvG: 'Contacts', linkTypeName: 'Contact'),
    ModelLinkInfo2( linkTypeIndex: '1', linkTypeSvG: 'mail', linkTypeName: 'Email',url: ""),
    ModelLinkInfo2( linkTypeIndex: '2',linkTypeSvG: 'locationgoogle',linkTypeName: 'Location',url: ""),
    ModelLinkInfo2( linkTypeIndex: '3', linkTypeSvG: 'phonenumber',  linkTypeName: 'Phone Number',url: ""),
    ModelLinkInfo2(linkTypeIndex: '4',linkTypeSvG: 'apple-messages',linkTypeName: 'Text',url: ""),
    ModelLinkInfo2(  linkTypeIndex: '5', linkTypeSvG: 'whatssapp', linkTypeName: 'Whatsapp',url: ""),
    ModelLinkInfo2(  linkTypeIndex: '6', linkTypeSvG: 'behance', linkTypeName: 'Behance',url: ""),
    ModelLinkInfo2( linkTypeIndex: '7', linkTypeSvG: 'dribbble', linkTypeName: 'Dribble',url: ""),
    ModelLinkInfo2(
        linkTypeIndex: '8', linkTypeSvG: 'facebook', linkTypeName: 'Facebook',url: ""),
    ModelLinkInfo2(
        linkTypeIndex: '15', linkTypeSvG: 'insta', linkTypeName: 'Instagram',url: ""),
    ModelLinkInfo2(
        linkTypeIndex: '10', linkTypeSvG: 'linkedin', linkTypeName: 'Linkedin',url: ""),
    ModelLinkInfo2(
        linkTypeIndex: '12', linkTypeSvG: 'telegram', linkTypeName: 'Telegram',url: ""),
    ModelLinkInfo2(linkTypeIndex: '11',linkTypeSvG: 'pinterest',linkTypeName: 'Pinterest',url: ""),
    //munib
    ModelLinkInfo2(
        linkTypeIndex: '9', linkTypeSvG: 'tiktok', linkTypeName: 'Tiktok',url: ""),
    ModelLinkInfo2(
        linkTypeIndex: '14', linkTypeSvG: 'twitter', linkTypeName: 'Twitter',url: ""),
    ModelLinkInfo2(
        linkTypeIndex: '19', linkTypeSvG: 'twitch', linkTypeName: 'Twitch',url: ""),
    ModelLinkInfo2(
        linkTypeIndex: '16', linkTypeSvG: 'skype', linkTypeName: 'Skype',url: ""),
    ModelLinkInfo2(
        linkTypeIndex: '17', linkTypeSvG: 'snapchat', linkTypeName: 'Snapchat',url: ""),
    ModelLinkInfo2(
        linkTypeIndex: '18', linkTypeSvG: 'vimeo', linkTypeName: 'Vimeo',url: ""),
    ModelLinkInfo2(
        linkTypeIndex: '13', linkTypeSvG: 'youtube', linkTypeName: 'Youtube',url: ""),
    ModelLinkInfo2(   linkTypeIndex: '20',  linkTypeSvG: 'amazon-music',  linkTypeName: 'Amazon Music',url: ""),
    ModelLinkInfo2(linkTypeIndex: '21',linkTypeSvG: 'apple-music',linkTypeName: 'Apple Music',url: ""),
    ModelLinkInfo2(linkTypeIndex: '22', linkTypeSvG: 'sound_cloud', linkTypeName: 'SoundCloud',url: ""),
    ModelLinkInfo2(linkTypeIndex: '23', linkTypeSvG: 'spotify', linkTypeName: 'Spotify',url: ""),
    ModelLinkInfo2(linkTypeIndex: '24', linkTypeSvG: 'lydia', linkTypeName: 'Lydia',url: ""),
    ModelLinkInfo2(linkTypeIndex: '25', linkTypeSvG: 'PayPal', linkTypeName: 'Paypal',url: ""),
    ModelLinkInfo2(linkTypeIndex: '26', linkTypeSvG: 'stripee', linkTypeName: 'Stripe',url: ""),
    ModelLinkInfo2(linkTypeIndex: '27', linkTypeSvG: 'western_union', linkTypeName: 'Western Union',url: ""),
    ModelLinkInfo2(linkTypeIndex: '28', linkTypeSvG: 'costumelink',   linkTypeName: 'Custom Link',url: ""),
    ModelLinkInfo2(linkTypeIndex: '29', linkTypeSvG: 'ufileupload',linkTypeName: 'Upload file',url: ""),
    ModelLinkInfo2(linkTypeIndex: '30', linkTypeSvG: 'googleplay', linkTypeName: 'App Link',url: ""),
    ModelLinkInfo2(linkTypeIndex: '31', linkTypeSvG: 'googlelogo', linkTypeName: 'Google Reviews',url: ""),
    ModelLinkInfo2(linkTypeIndex: '32', linkTypeSvG: 'open', linkTypeName: 'OpenSea',url: ""),
    ModelLinkInfo2(linkTypeIndex: '33', linkTypeSvG: 'onlyfans', linkTypeName: 'OnlyFans',url: ""),
    ModelLinkInfo2(linkTypeIndex: '34', linkTypeSvG: 'chrom', linkTypeName: 'Website',url: ""),
    ModelLinkInfo2(linkTypeIndex: '35', linkTypeSvG: 'googlelogo', linkTypeName: 'Contact',url: ""),
  ];
}
