const String tableGroupT = 'GroupT';

const exTableGroupT = ''' CREATE TABLE $tableGroupT (
          ${GroupTFileds.groupId} TEXT PRIMARY KEY  ,
          ${GroupTFileds.userTId} TEXT  ,
          ${GroupTFileds.groupPhotoPath} TEXT  ,
          ${GroupTFileds.groupTitle} TEXT  ,
          ${GroupTFileds.groupLink} TEXT  
        ); ''';

class GroupTFileds {

  static final List<String> groupTValues = [
    groupId,
    userTId,
    groupPhotoPath,
    groupTitle,
    groupLink,
  ];

  static const String groupId = "groupId";
  static const String userTId = "userTId";
  static const String groupPhotoPath = "groupPhotoPath";
  static const String groupTitle = "groupTitle";
  static const String groupLink = "groupLink";
}

class ModelGroupT {
  String? groupId;
  String? userTId;
  String? groupPhotoPath;
  String? groupTitle;
  String? groupLink;

  ModelGroupT({
    this.groupId,
    this.userTId,
    this.groupPhotoPath,
    this.groupTitle,
    this.groupLink,
  });

  ModelGroupT copy({
    String? groupId,
    String? userTId,
    String? groupPhotoPath,
    String? groupTitle,
    String? groupLink,
  }) =>
      ModelGroupT(
        groupId: groupId ?? this.groupId,
        userTId: userTId ?? this.userTId,
        groupPhotoPath: groupPhotoPath ?? this.groupPhotoPath,
        groupTitle: groupTitle ?? this.groupTitle,
        groupLink: groupLink ?? this.groupLink,
      );

  ModelGroupT.fromJson(Map<String, dynamic> json) {
    groupId = json['groupId'];
    userTId = json['userTId'];
    groupPhotoPath = json['groupPhotoPath'];
    groupTitle = json['groupTitle'];
    groupLink = json['groupLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['groupId'] = groupId;
    data['userTId'] = userTId;
    data['groupPhotoPath'] = groupPhotoPath;
    data['groupTitle'] = groupTitle;
    data['groupLink'] = groupLink;

    return data;
  }
}
