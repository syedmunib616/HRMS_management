const String tableMember = 'Members';

const exTableMember = ''' CREATE TABLE $tableMember (
          ${MemberFileds.membersId} TEXT  PRIMARY KEY  ,
          ${MemberFileds.userTId} TEXT ,
          ${MemberFileds.groupId} TEXT  
        ); ''';

class MemberFileds {

  static final List<String> memberValues = [
    membersId,
    userTId,
    groupId,
  ];

  static const String membersId = "membersId";
  static const String userTId = "userTId";
  static const String groupId = "groupId";

}

class ModelMember {
  String? membersId;
  String? userTId;
  String? groupId;

  ModelMember({
    this.membersId,
    this.userTId,
    this.groupId,
  });

  ModelMember copy({
    String? membersId,
    String? userTId,
    String? groupId,
  }) =>
      ModelMember(
        membersId: membersId ?? this.membersId,
        userTId: userTId ?? this.userTId,
        groupId: groupId ?? this.groupId,
      );

  ModelMember.fromJson(Map<String, dynamic> json) {
    membersId = json['membersId'];
    userTId = json['userTId'];
    groupId = json['groupId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['membersId'] = membersId;
    data['userTId'] = userTId;
    data['groupId'] = groupId;
    return data;
  }
}
