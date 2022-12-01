const String tableContact = 'Contact';

const exTableContact = ''' CREATE TABLE $tableContact (
          ${ContactFileds.contactId} TEXT PRIMARY KEY  ,
          ${ContactFileds.userTId} TEXT ,
          ${ContactFileds.friendId} TEXT
        ); ''';

class ContactFileds {
  static final List<String> contactValues = [
    contactId,
    userTId,
    friendId,
  ];

  static const String contactId = "contactId";
  static const String userTId = "userTId";
  static const String friendId = "friendId";
}

class ModelContact {
  String? contactId;
  String? userTId;
  String? friendId;

  ModelContact({
    this.contactId,
    this.userTId,
    this.friendId,
  });

  ModelContact copy({
    String? contactId,
    String? userTId,
    String? friendId,
  }) =>
      ModelContact(
        contactId: contactId ?? this.contactId,
        userTId: userTId ?? this.userTId,
        friendId: friendId ?? this.friendId,
      );

  ModelContact.fromJson(Map<String, dynamic> json) {
    contactId = json['contactId'];
    userTId = json['userTId'];
    friendId = json['friendId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contactId'] = contactId;
    data['userTId'] = userTId;
    data['friendId'] = friendId;
    return data;
  }
}
