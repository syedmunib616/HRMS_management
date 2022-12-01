// const String tableLink = 'links';

// const exTableLink = ''' CREATE TABLE $tableLink (
//           ${LinkFileds.linksId} TEXT PRIMARY KEY  ,
           
//   ${LinkFileds.userTId} TEXT  ,
//   ${LinkFileds.linkContact} TEXT,
//   ${LinkFileds.linkEmail} TEXT,
//   ${LinkFileds.linkLocation} TEXT,
//   ${LinkFileds.linkPhoneNumber} TEXT,
//   ${LinkFileds.linkWhatsapp} TEXT,
//   ${LinkFileds.linkBehances} TEXT,
//   ${LinkFileds.linkDribble} TEXT,
//   ${LinkFileds.linkFacebook} TEXT,
//   ${LinkFileds.linkInstagram} TEXT,
//   ${LinkFileds.linkLinkedin} TEXT,
//   ${LinkFileds.linkPinterest} TEXT,
//   ${LinkFileds.linkTelegram} TEXT,
//   ${LinkFileds.linkTiktok} TEXT,
//   ${LinkFileds.linkTwitter} TEXT,
//   ${LinkFileds.linkTwitch} TEXT,
//   ${LinkFileds.linkSkype} TEXT,
//   ${LinkFileds.linkSnapchat} TEXT,
//   ${LinkFileds.linkVimeo} TEXT,
//   ${LinkFileds.linkYoutube} TEXT,
//   ${LinkFileds.linkAmazonMusic} TEXT,
//   ${LinkFileds.linkAppleMusic} TEXT,
//   ${LinkFileds.linkSoundCloud} TEXT,
//   ${LinkFileds.linkSpotify} TEXT,
//   ${LinkFileds.linkLydia} TEXT,
//   ${LinkFileds.linkPaypal} TEXT,
//   ${LinkFileds.linkStrip} TEXT,
//   ${LinkFileds.linkWesternUnion} TEXT,
//   ${LinkFileds.linkCostume} TEXT,
//   ${LinkFileds.linkUploadedFile} TEXT,
//   ${LinkFileds.linkPlayStore} TEXT,
//   ${LinkFileds.linkAppStore} TEXT,
//   ${LinkFileds.linkGoogleReviews} TEXT,
//   ${LinkFileds.linkOpenSea} TEXT,
//   ${LinkFileds.linkOnlyFans} TEXT,
//   ${LinkFileds.linkWebSite} TEXT,

//   ${LinkFileds.isVisibleContact}               INTEGER ,
//   ${LinkFileds.isVisibleEmail}                 INTEGER ,
//   ${LinkFileds.isVisibleLocation}              INTEGER ,
//   ${LinkFileds.isVisiblePhoneNumber}           INTEGER ,
//   ${LinkFileds.isVisibleWhatsapp}              INTEGER ,
//   ${LinkFileds.isVisibleBehances}              INTEGER ,
//   ${LinkFileds.isVisibleDribble}               INTEGER ,
//   ${LinkFileds.isVisibleFacebook}              INTEGER ,
//   ${LinkFileds.isVisibleInstagram}             INTEGER ,
//   ${LinkFileds.isVisibleLinkedin}              INTEGER ,
//   ${LinkFileds.isVisiblePinterest}             INTEGER ,
//   ${LinkFileds.isVisibleTelegram}              INTEGER ,
//   ${LinkFileds.isVisibleTiktok}                INTEGER ,
//   ${LinkFileds.isVisibleTwitter}               INTEGER ,
//   ${LinkFileds.isVisibleTwitch}                INTEGER ,
//   ${LinkFileds.isVisibleSkype}                 INTEGER ,
//   ${LinkFileds.isVisibleSnapchat}              INTEGER ,
//   ${LinkFileds.isVisibleVimeo}                 INTEGER ,
//   ${LinkFileds.isVisibleYoutube}               INTEGER ,
//   ${LinkFileds.isVisibleAmazonMusic}           INTEGER ,
//   ${LinkFileds.isVisibleAppleMusic}            INTEGER ,
//   ${LinkFileds.isVisibleSoundCloud}            INTEGER ,
//   ${LinkFileds.isVisibleSpotify}               INTEGER ,
//   ${LinkFileds.isVisibleLydia}                 INTEGER ,
//   ${LinkFileds.isVisiblePaypal}                INTEGER ,
//   ${LinkFileds.isVisibleStrip}                 INTEGER ,
//   ${LinkFileds.isVisibleWesternUnion}          INTEGER ,
//   ${LinkFileds.isVisibleCostume}               INTEGER ,
//   ${LinkFileds.isVisibleUploadedFile}          INTEGER ,
//   ${LinkFileds.isVisiblePlayStore}             INTEGER ,
//   ${LinkFileds.isVisibleAppStore}              INTEGER ,
//   ${LinkFileds.isVisibleGoogleReviews}         INTEGER ,
//   ${LinkFileds.isVisibleOpenSea}        INTEGER ,
//   ${LinkFileds.isVisibleOnlyFans}      INTEGER ,
//   ${LinkFileds.isVisibleWebSite}       INTEGER 




//         ); ''';

// class LinkFileds {
//   static final List<String> linkValues = [
//     linksId,
//     userTId,
//     linkContact,
//     linkEmail,
//     linkLocation,
//     linkPhoneNumber,
//     linkWhatsapp,
//     linkBehances,
//     linkDribble,
//     linkFacebook,
//     linkInstagram,
//     linkLinkedin,
//     linkPinterest,
//     linkTelegram,
//     linkTiktok,
//     linkTwitter,
//     linkTwitch,
//     linkSkype,
//     linkSnapchat,
//     linkVimeo,
//     linkYoutube,
//     linkAmazonMusic,
//     linkAppleMusic,
//     linkSoundCloud,
//     linkSpotify,
//     linkLydia,
//     linkPaypal,
//     linkStrip,
//     linkWesternUnion,
//     linkCostume,
//     linkUploadedFile,
//     linkPlayStore,
//     linkAppStore,
//     linkGoogleReviews,
//     linkOpenSea,
//     linkOnlyFans,
//     linkWebSite,
//     isVisibleContact,
//     isVisibleEmail,
//     isVisibleLocation,
//     isVisiblePhoneNumber,
//     isVisibleWhatsapp,
//     isVisibleBehances,
//     isVisibleDribble,
//     isVisibleFacebook,
//     isVisibleInstagram,
//     isVisibleLinkedin,
//     isVisiblePinterest,
//     isVisibleTelegram,
//     isVisibleTiktok,
//     isVisibleTwitter,
//     isVisibleTwitch,
//     isVisibleSkype,
//     isVisibleSnapchat,
//     isVisibleVimeo,
//     isVisibleYoutube,
//     isVisibleAmazonMusic,
//     isVisibleAppleMusic,
//     isVisibleSoundCloud,
//     isVisibleSpotify,
//     isVisibleLydia,
//     isVisiblePaypal,
//     isVisibleStrip,
//     isVisibleWesternUnion,
//     isVisibleCostume,
//     isVisibleUploadedFile,
//     isVisiblePlayStore,
//     isVisibleAppStore,
//     isVisibleGoogleReviews,
//     isVisibleOpenSea,
//     isVisibleOnlyFans,
//     isVisibleWebSite,
//   ];

//   static const String linksId = "linksId";
//   static const String userTId = "userTId";
//   static const String linkContact = "linkContact";
//   static const String linkEmail = "linkEmail";
//   static const String linkLocation = "linkLocation";
//   static const String linkPhoneNumber = "linkPhoneNumber";
//   static const String linkWhatsapp = "linkWhatsapp";
//   static const String linkBehances = "linkBehances";
//   static const String linkDribble = "linkDribble";
//   static const String linkFacebook = "linkFacebook";
//   static const String linkInstagram = "linkInstagram";
//   static const String linkLinkedin = "linkLinkedin";
//   static const String linkPinterest = "linkPinterest";
//   static const String linkTelegram = "linkTelegram";
//   static const String linkTiktok = "linkTiktok";
//   static const String linkTwitter = "linkTwitter";
//   static const String linkTwitch = "linkTwitch";
//   static const String linkSkype = "linkSkype";
//   static const String linkSnapchat = "linkSnapchat";
//   static const String linkVimeo = "linkVimeo";
//   static const String linkYoutube = "linkYoutube";
//   static const String linkAmazonMusic = "linkAmazonMusic";
//   static const String linkAppleMusic = "linkAppleMusic";
//   static const String linkSoundCloud = "linkSoundCloud";
//   static const String linkSpotify = "linkSpotify";
//   static const String linkLydia = "linkLydia";
//   static const String linkPaypal = "linkPaypal";
//   static const String linkStrip = "linkStrip";
//   static const String linkWesternUnion = "linkWesternUnion";
//   static const String linkCostume = "linkCostume";
//   static const String linkUploadedFile = "linkUploadedFile";
//   static const String linkPlayStore = "linkPlayStore";
//   static const String linkAppStore = "linkAppStore";
//   static const String linkGoogleReviews = "linkGoogleReviews";
//   static const String linkOpenSea = "linkOpenSea";
//   static const String linkOnlyFans = "linkOnlyFans";
//   static const String linkWebSite = "linkWebSite";
//   static const String isVisibleContact = "isVisibleContact";
//   static const String isVisibleEmail = "isVisibleEmail";
//   static const String isVisibleLocation = "isVisibleLocation";
//   static const String isVisiblePhoneNumber = "isVisiblePhoneNumber";
//   static const String isVisibleWhatsapp = "isVisibleWhatsapp";
//   static const String isVisibleBehances = "isVisibleBehances";
//   static const String isVisibleDribble = "isVisibleDribble";
//   static const String isVisibleFacebook = "isVisibleFacebook";
//   static const String isVisibleInstagram = "isVisibleInstagram";
//   static const String isVisibleLinkedin = "isVisibleLinkedin";
//   static const String isVisiblePinterest = "isVisiblePinterest";
//   static const String isVisibleTelegram = "isVisibleTelegram";
//   static const String isVisibleTiktok = "isVisibleTiktok";
//   static const String isVisibleTwitter = "isVisibleTwitter";
//   static const String isVisibleTwitch = "isVisibleTwitch";
//   static const String isVisibleSkype = "isVisibleSkype";
//   static const String isVisibleSnapchat = "isVisibleSnapchat";
//   static const String isVisibleVimeo = "isVisibleVimeo";
//   static const String isVisibleYoutube = "isVisibleYoutube";
//   static const String isVisibleAmazonMusic = "isVisibleAmazonMusic";
//   static const String isVisibleAppleMusic = "isVisibleAppleMusic";
//   static const String isVisibleSoundCloud = "isVisibleSoundCloud";
//   static const String isVisibleSpotify = "isVisibleSpotify";
//   static const String isVisibleLydia = "isVisibleLydia";
//   static const String isVisiblePaypal = "isVisiblePaypal";
//   static const String isVisibleStrip = "isVisibleStrip";
//   static const String isVisibleWesternUnion = "isVisibleWesternUnion";
//   static const String isVisibleCostume = "isVisibleCostume";
//   static const String isVisibleUploadedFile = "isVisibleUploadedFile";
//   static const String isVisiblePlayStore = "isVisiblePlayStore";
//   static const String isVisibleAppStore = "isVisibleAppStore";
//   static const String isVisibleGoogleReviews = "isVisibleGoogleReviews";
//   static const String isVisibleOpenSea = "isVisibleOpenSea";
//   static const String isVisibleOnlyFans = "isVisibleOnlyFans";
//   static const String isVisibleWebSite = "isVisibleWebSite";
// }

// class ModelLinks {
//   String? linksId;
//   String? userTId;
//   String? linkContact;
//   String? linkEmail;
//   String? linkLocation;
//   String? linkPhoneNumber;
//   String? linkWhatsapp;
//   String? linkBehances;
//   String? linkDribble;
//   String? linkFacebook;
//   String? linkInstagram;
//   String? linkLinkedin;
//   String? linkPinterest;
//   String? linkTelegram;
//   String? linkTiktok;
//   String? linkTwitter;
//   String? linkTwitch;
//   String? linkSkype;
//   String? linkSnapchat;
//   String? linkVimeo;
//   String? linkYoutube;
//   String? linkAmazonMusic;
//   String? linkAppleMusic;
//   String? linkSoundCloud;
//   String? linkSpotify;
//   String? linkLydia;
//   String? linkPaypal;
//   String? linkStrip;
//   String? linkWesternUnion;
//   String? linkCostume;
//   String? linkUploadedFile;
//   String? linkPlayStore;
//   String? linkAppStore;
//   String? linkGoogleReviews;
//   String? linkOpenSea;
//   String? linkOnlyFans;
//   String? linkWebSite;
//   bool? isVisibleContact;
//   bool? isVisibleEmail;
//   bool? isVisibleLocation;
//   bool? isVisiblePhoneNumber;
//   bool? isVisibleWhatsapp;
//   bool? isVisibleBehances;
//   bool? isVisibleDribble;
//   bool? isVisibleFacebook;
//   bool? isVisibleInstagram;
//   bool? isVisibleLinkedin;
//   bool? isVisiblePinterest;
//   bool? isVisibleTelegram;
//   bool? isVisibleTiktok;
//   bool? isVisibleTwitter;
//   bool? isVisibleTwitch;
//   bool? isVisibleSkype;
//   bool? isVisibleSnapchat;
//   bool? isVisibleVimeo;
//   bool? isVisibleYoutube;
//   bool? isVisibleAmazonMusic;
//   bool? isVisibleAppleMusic;
//   bool? isVisibleSoundCloud;
//   bool? isVisibleSpotify;
//   bool? isVisibleLydia;
//   bool? isVisiblePaypal;
//   bool? isVisibleStrip;
//   bool? isVisibleWesternUnion;
//   bool? isVisibleCostume;
//   bool? isVisibleUploadedFile;
//   bool? isVisiblePlayStore;
//   bool? isVisibleAppStore;
//   bool? isVisibleGoogleReviews;
//   bool? isVisibleOpenSea;
//   bool? isVisibleOnlyFans;
//   bool? isVisibleWebSite;

//   ModelLinks({
//     this.linksId,
//     this.userTId,
//     this.linkContact,
//     this.linkEmail,
//     this.linkLocation,
//     this.linkPhoneNumber,
//     this.linkWhatsapp,
//     this.linkBehances,
//     this.linkDribble,
//     this.linkFacebook,
//     this.linkInstagram,
//     this.linkLinkedin,
//     this.linkPinterest,
//     this.linkTelegram,
//     this.linkTiktok,
//     this.linkTwitter,
//     this.linkTwitch,
//     this.linkSkype,
//     this.linkSnapchat,
//     this.linkVimeo,
//     this.linkYoutube,
//     this.linkAmazonMusic,
//     this.linkAppleMusic,
//     this.linkSoundCloud,
//     this.linkSpotify,
//     this.linkLydia,
//     this.linkPaypal,
//     this.linkStrip,
//     this.linkWesternUnion,
//     this.linkCostume,
//     this.linkUploadedFile,
//     this.linkPlayStore,
//     this.linkAppStore,
//     this.linkGoogleReviews,
//     this.linkOpenSea,
//     this.linkOnlyFans,
//     this.linkWebSite,
//     this.isVisibleContact,
//     this.isVisibleEmail,
//     this.isVisibleLocation,
//     this.isVisiblePhoneNumber,
//     this.isVisibleWhatsapp,
//     this.isVisibleBehances,
//     this.isVisibleDribble,
//     this.isVisibleFacebook,
//     this.isVisibleInstagram,
//     this.isVisibleLinkedin,
//     this.isVisiblePinterest,
//     this.isVisibleTelegram,
//     this.isVisibleTiktok,
//     this.isVisibleTwitter,
//     this.isVisibleTwitch,
//     this.isVisibleSkype,
//     this.isVisibleSnapchat,
//     this.isVisibleVimeo,
//     this.isVisibleYoutube,
//     this.isVisibleAmazonMusic,
//     this.isVisibleAppleMusic,
//     this.isVisibleSoundCloud,
//     this.isVisibleSpotify,
//     this.isVisibleLydia,
//     this.isVisiblePaypal,
//     this.isVisibleStrip,
//     this.isVisibleWesternUnion,
//     this.isVisibleCostume,
//     this.isVisibleUploadedFile,
//     this.isVisiblePlayStore,
//     this.isVisibleAppStore,
//     this.isVisibleGoogleReviews,
//     this.isVisibleOpenSea,
//     this.isVisibleOnlyFans,
//     this.isVisibleWebSite,
//   });

//   ModelLinks copy({
//     String? linksId,
//     String? userTId,
//     String? linkContact,
//     String? linkEmail,
//     String? linkLocation,
//     String? linkPhoneNumber,
//     String? linkWhatsapp,
//     String? linkBehances,
//     String? linkDribble,
//     String? linkFacebook,
//     String? linkInstagram,
//     String? linkLinkedin,
//     String? linkPinterest,
//     String? linkTelegram,
//     String? linkTiktok,
//     String? linkTwitter,
//     String? linkTwitch,
//     String? linkSkype,
//     String? linkSnapchat,
//     String? linkVimeo,
//     String? linkYoutube,
//     String? linkAmazonMusic,
//     String? linkAppleMusic,
//     String? linkSoundCloud,
//     String? linkSpotify,
//     String? linkLydia,
//     String? linkPaypal,
//     String? linkStrip,
//     String? linkWesternUnion,
//     String? linkCostume,
//     String? linkUploadedFile,
//     String? linkPlayStore,
//     String? linkAppStore,
//     String? linkGoogleReviews,
//     String? linkOpenSea,
//     String? linkOnlyFans,
//     String? linkWebSite,
//     bool? isVisibleContact,
//     bool? isVisibleEmail,
//     bool? isVisibleLocation,
//     bool? isVisiblePhoneNumber,
//     bool? isVisibleWhatsapp,
//     bool? isVisibleBehances,
//     bool? isVisibleDribble,
//     bool? isVisibleFacebook,
//     bool? isVisibleInstagram,
//     bool? isVisibleLinkedin,
//     bool? isVisiblePinterest,
//     bool? isVisibleTelegram,
//     bool? isVisibleTiktok,
//     bool? isVisibleTwitter,
//     bool? isVisibleTwitch,
//     bool? isVisibleSkype,
//     bool? isVisibleSnapchat,
//     bool? isVisibleVimeo,
//     bool? isVisibleYoutube,
//     bool? isVisibleAmazonMusic,
//     bool? isVisibleAppleMusic,
//     bool? isVisibleSoundCloud,
//     bool? isVisibleSpotify,
//     bool? isVisibleLydia,
//     bool? isVisiblePaypal,
//     bool? isVisibleStrip,
//     bool? isVisibleWesternUnion,
//     bool? isVisibleCostume,
//     bool? isVisibleUploadedFile,
//     bool? isVisiblePlayStore,
//     bool? isVisibleAppStore,
//     bool? isVisibleGoogleReviews,
//     bool? isVisibleOpenSea,
//     bool? isVisibleOnlyFans,
//     bool? isVisibleWebSite,
//   }) =>
//       ModelLinks(
//         linksId: linksId ?? this.linksId,
//         userTId: userTId ?? this.userTId,
//         linkContact: linkContact ?? this.linkContact,
//         linkEmail: linkEmail ?? this.linkEmail,
//         linkLocation: linkLocation ?? this.linkLocation,
//         linkPhoneNumber: linkPhoneNumber ?? this.linkPhoneNumber,
//         linkWhatsapp: linkWhatsapp ?? this.linkWhatsapp,
//         linkBehances: linkBehances ?? this.linkBehances,
//         linkDribble: linkDribble ?? this.linkDribble,
//         linkFacebook: linkFacebook ?? this.linkFacebook,
//         linkInstagram: linkInstagram ?? this.linkInstagram,
//         linkLinkedin: linkLinkedin ?? this.linkLinkedin,
//         linkPinterest: linkPinterest ?? this.linkPinterest,
//         linkTelegram: linkTelegram ?? this.linkTelegram,
//         linkTiktok: linkTiktok ?? this.linkTiktok,
//         linkTwitter: linkTwitter ?? this.linkTwitter,
//         linkTwitch: linkTwitch ?? this.linkTwitch,
//         linkSkype: linkSkype ?? this.linkSkype,
//         linkSnapchat: linkSnapchat ?? this.linkSnapchat,
//         linkVimeo: linkVimeo ?? this.linkVimeo,
//         linkYoutube: linkYoutube ?? this.linkYoutube,
//         linkAmazonMusic: linkAmazonMusic ?? this.linkAmazonMusic,
//         linkAppleMusic: linkAppleMusic ?? this.linkAppleMusic,
//         linkSoundCloud: linkSoundCloud ?? this.linkSoundCloud,
//         linkSpotify: linkSpotify ?? this.linkSpotify,
//         linkLydia: linkLydia ?? this.linkLydia,
//         linkPaypal: linkPaypal ?? this.linkPaypal,
//         linkStrip: linkStrip ?? this.linkStrip,
//         linkWesternUnion: linkWesternUnion ?? this.linkWesternUnion,
//         linkCostume: linkCostume ?? this.linkCostume,
//         linkUploadedFile: linkUploadedFile ?? this.linkUploadedFile,
//         linkPlayStore: linkPlayStore ?? this.linkPlayStore,
//         linkAppStore: linkAppStore ?? this.linkAppStore,
//         linkGoogleReviews: linkGoogleReviews ?? this.linkGoogleReviews,
//         linkOpenSea: linkOpenSea ?? this.linkOpenSea,
//         linkOnlyFans: linkOnlyFans ?? this.linkOnlyFans,
//         linkWebSite: linkWebSite ?? this.linkWebSite,
//         isVisibleContact: isVisibleContact ?? this.isVisibleContact,
//         isVisibleEmail: isVisibleEmail ?? this.isVisibleEmail,
//         isVisibleLocation: isVisibleLocation ?? this.isVisibleLocation,
//         isVisiblePhoneNumber: isVisiblePhoneNumber ?? this.isVisiblePhoneNumber,
//         isVisibleWhatsapp: isVisibleWhatsapp ?? this.isVisibleWhatsapp,
//         isVisibleBehances: isVisibleBehances ?? this.isVisibleBehances,
//         isVisibleDribble: isVisibleDribble ?? this.isVisibleDribble,
//         isVisibleFacebook: isVisibleFacebook ?? this.isVisibleFacebook,
//         isVisibleInstagram: isVisibleInstagram ?? this.isVisibleInstagram,
//         isVisibleLinkedin: isVisibleLinkedin ?? this.isVisibleLinkedin,
//         isVisiblePinterest: isVisiblePinterest ?? this.isVisiblePinterest,
//         isVisibleTelegram: isVisibleTelegram ?? this.isVisibleTelegram,
//         isVisibleTiktok: isVisibleTiktok ?? this.isVisibleTiktok,
//         isVisibleTwitter: isVisibleTwitter ?? this.isVisibleTwitter,
//         isVisibleTwitch: isVisibleTwitch ?? this.isVisibleTwitch,
//         isVisibleSkype: isVisibleSkype ?? this.isVisibleSkype,
//         isVisibleSnapchat: isVisibleSnapchat ?? this.isVisibleSnapchat,
//         isVisibleVimeo: isVisibleVimeo ?? this.isVisibleVimeo,
//         isVisibleYoutube: isVisibleYoutube ?? this.isVisibleYoutube,
//         isVisibleAmazonMusic: isVisibleAmazonMusic ?? this.isVisibleAmazonMusic,
//         isVisibleAppleMusic: isVisibleAppleMusic ?? this.isVisibleAppleMusic,
//         isVisibleSoundCloud: isVisibleSoundCloud ?? this.isVisibleSoundCloud,
//         isVisibleSpotify: isVisibleSpotify ?? this.isVisibleSpotify,
//         isVisibleLydia: isVisibleLydia ?? this.isVisibleLydia,
//         isVisiblePaypal: isVisiblePaypal ?? this.isVisiblePaypal,
//         isVisibleStrip: isVisibleStrip ?? this.isVisibleStrip,
//         isVisibleWesternUnion:
//             isVisibleWesternUnion ?? this.isVisibleWesternUnion,
//         isVisibleCostume: isVisibleCostume ?? this.isVisibleCostume,
//         isVisibleUploadedFile:
//             isVisibleUploadedFile ?? this.isVisibleUploadedFile,
//         isVisiblePlayStore: isVisiblePlayStore ?? this.isVisiblePlayStore,
//         isVisibleAppStore: isVisibleAppStore ?? this.isVisibleAppStore,
//         isVisibleGoogleReviews:
//             isVisibleGoogleReviews ?? this.isVisibleGoogleReviews,
//         isVisibleOpenSea: isVisibleOpenSea ?? this.isVisibleOpenSea,
//         isVisibleOnlyFans: isVisibleOnlyFans ?? this.isVisibleOnlyFans,
//         isVisibleWebSite: isVisibleWebSite ?? this.isVisibleWebSite,
//       );

//   ModelLinks.fromJson(Map<String, dynamic> json) {
//     linksId = json['linksId'];
//     userTId = json['userTId'];
//     linkContact = json['linkContact'];
//     linkEmail = json['linkEmail'];
//     linkLocation = json['linkLocation'];
//     linkPhoneNumber = json['linkPhoneNumber'];
//     linkWhatsapp = json['linkWhatsapp'];
//     linkBehances = json['linkBehances'];
//     linkDribble = json['linkDribble'];
//     linkFacebook = json['linkFacebook'];
//     linkInstagram = json['linkInstagram'];
//     linkLinkedin = json['linkLinkedin'];
//     linkPinterest = json['linkPinterest'];
//     linkTelegram = json['linkTelegram'];
//     linkTiktok = json['linkTiktok'];
//     linkTwitter = json['linkTwitter'];
//     linkTwitch = json['linkTwitch'];
//     linkSkype = json['linkSkype'];
//     linkSnapchat = json['linkSnapchat'];
//     linkVimeo = json['linkVimeo'];
//     linkYoutube = json['linkYoutube'];
//     linkAmazonMusic = json['linkAmazonMusic'];
//     linkAppleMusic = json['linkAppleMusic'];
//     linkSoundCloud = json['linkSoundCloud'];
//     linkSpotify = json['linkSpotify'];
//     linkLydia = json['linkLydia'];
//     linkPaypal = json['linkPaypal'];
//     linkStrip = json['linkStrip'];
//     linkWesternUnion = json['linkWesternUnion'];
//     linkCostume = json['linkCostume'];
//     linkUploadedFile = json['linkUploadedFile'];
//     linkPlayStore = json['linkPlayStore'];
//     linkAppStore = json['linkAppStore'];
//     linkGoogleReviews = json['linkGoogleReviews'];
//     linkOpenSea = json['linkOpenSea'];
//     linkOnlyFans = json['linkOnlyFans'];
//     linkWebSite = json['linkWebSite'];
//     isVisibleContact = json['isVisibleContact'];
//     isVisibleEmail = json['isVisibleEmail'];
//     isVisibleLocation = json['isVisibleLocation'];
//     isVisiblePhoneNumber = json['isVisiblePhoneNumber'];
//     isVisibleWhatsapp = json['isVisibleWhatsapp'];
//     isVisibleBehances = json['isVisibleBehances'];
//     isVisibleDribble = json['isVisibleDribble'];
//     isVisibleFacebook = json['isVisibleFacebook'];
//     isVisibleInstagram = json['isVisibleInstagram'];
//     isVisibleLinkedin = json['isVisibleLinkedin'];
//     isVisiblePinterest = json['isVisiblePinterest'];
//     isVisibleTelegram = json['isVisibleTelegram'];
//     isVisibleTiktok = json['isVisibleTiktok'];
//     isVisibleTwitter = json['isVisibleTwitter'];
//     isVisibleTwitch = json['isVisibleTwitch'];
//     isVisibleSkype = json['isVisibleSkype'];
//     isVisibleSnapchat = json['isVisibleSnapchat'];
//     isVisibleVimeo = json['isVisibleVimeo'];
//     isVisibleYoutube = json['isVisibleYoutube'];
//     isVisibleAmazonMusic = json['isVisibleAmazonMusic'];
//     isVisibleAppleMusic = json['isVisibleAppleMusic'];
//     isVisibleSoundCloud = json['isVisibleSoundCloud'];
//     isVisibleSpotify = json['isVisibleSpotify'];
//     isVisibleLydia = json['isVisibleLydia'];
//     isVisiblePaypal = json['isVisiblePaypal'];
//     isVisibleStrip = json['isVisibleStrip'];
//     isVisibleWesternUnion = json['isVisibleWesternUnion'];
//     isVisibleCostume = json['isVisibleCostume'];
//     isVisibleUploadedFile = json['isVisibleUploadedFile'];
//     isVisiblePlayStore = json['isVisiblePlayStore'];
//     isVisibleAppStore = json['isVisibleAppStore'];
//     isVisibleGoogleReviews = json['isVisibleGoogleReviews'];
//     isVisibleOpenSea = json['isVisibleOpenSea'];
//     isVisibleOnlyFans = json['isVisibleOnlyFans'];
//     isVisibleWebSite = json['isVisibleWebSite'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['linksId'] = linksId;
//     data['userTId'] = userTId;
//     data['linkContact'] = linkContact;
//     data['linkEmail'] = linkEmail;
//     data['linkLocation'] = linkLocation;
//     data['linkPhoneNumber'] = linkPhoneNumber;
//     data['linkWhatsapp'] = linkWhatsapp;
//     data['linkBehances'] = linkBehances;
//     data['linkDribble'] = linkDribble;
//     data['linkFacebook'] = linkFacebook;
//     data['linkInstagram'] = linkInstagram;
//     data['linkLinkedin'] = linkLinkedin;
//     data['linkPinterest'] = linkPinterest;
//     data['linkTelegram'] = linkTelegram;
//     data['linkTiktok'] = linkTiktok;
//     data['linkTwitter'] = linkTwitter;
//     data['linkTwitch'] = linkTwitch;
//     data['linkSkype'] = linkSkype;
//     data['linkSnapchat'] = linkSnapchat;
//     data['linkVimeo'] = linkVimeo;
//     data['linkYoutube'] = linkYoutube;
//     data['linkAmazonMusic'] = linkAmazonMusic;
//     data['linkAppleMusic'] = linkAppleMusic;
//     data['linkSoundCloud'] = linkSoundCloud;
//     data['linkSpotify'] = linkSpotify;
//     data['linkLydia'] = linkLydia;
//     data['linkPaypal'] = linkPaypal;
//     data['linkStrip'] = linkStrip;
//     data['linkWesternUnion'] = linkWesternUnion;
//     data['linkCostume'] = linkCostume;
//     data['linkUploadedFile'] = linkUploadedFile;
//     data['linkPlayStore'] = linkPlayStore;
//     data['linkAppStore'] = linkAppStore;
//     data['linkGoogleReviews'] = linkGoogleReviews;
//     data['linkOpenSea'] = linkOpenSea;
//     data['linkOnlyFans'] = linkOnlyFans;
//     data['linkWebSite'] = linkWebSite;
//     data['isVisibleContact'] = isVisibleContact;
//     data['isVisibleEmail'] = isVisibleEmail;
//     data['isVisibleLocation'] = isVisibleLocation;
//     data['isVisiblePhoneNumber'] = isVisiblePhoneNumber;
//     data['isVisibleWhatsapp'] = isVisibleWhatsapp;
//     data['isVisibleBehances'] = isVisibleBehances;
//     data['isVisibleDribble'] = isVisibleDribble;
//     data['isVisibleFacebook'] = isVisibleFacebook;
//     data['isVisibleInstagram'] = isVisibleInstagram;
//     data['isVisibleLinkedin'] = isVisibleLinkedin;
//     data['isVisiblePinterest'] = isVisiblePinterest;
//     data['isVisibleTelegram'] = isVisibleTelegram;
//     data['isVisibleTiktok'] = isVisibleTiktok;
//     data['isVisibleTwitter'] = isVisibleTwitter;
//     data['isVisibleTwitch'] = isVisibleTwitch;
//     data['isVisibleSkype'] = isVisibleSkype;
//     data['isVisibleSnapchat'] = isVisibleSnapchat;
//     data['isVisibleVimeo'] = isVisibleVimeo;
//     data['isVisibleYoutube'] = isVisibleYoutube;
//     data['isVisibleAmazonMusic'] = isVisibleAmazonMusic;
//     data['isVisibleAppleMusic'] = isVisibleAppleMusic;
//     data['isVisibleSoundCloud'] = isVisibleSoundCloud;
//     data['isVisibleSpotify'] = isVisibleSpotify;
//     data['isVisibleLydia'] = isVisibleLydia;
//     data['isVisiblePaypal'] = isVisiblePaypal;
//     data['isVisibleStrip'] = isVisibleStrip;
//     data['isVisibleWesternUnion'] = isVisibleWesternUnion;
//     data['isVisibleCostume'] = isVisibleCostume;
//     data['isVisibleUploadedFile'] = isVisibleUploadedFile;
//     data['isVisiblePlayStore'] = isVisiblePlayStore;
//     data['isVisibleAppStore'] = isVisibleAppStore;
//     data['isVisibleGoogleReviews'] = isVisibleGoogleReviews;
//     data['isVisibleOpenSea'] = isVisibleOpenSea;
//     data['isVisibleOnlyFans'] = isVisibleOnlyFans;
//     data['isVisibleWebSite'] = isVisibleWebSite;
//     return data;
//   }
// }
