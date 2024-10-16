class UserModel {
  int userID;
  int parentID;
  String emailAddress;
  String fullName;
  String username;
  String password;
  int role;
  String level;
  int restriction;
  String picLoc;
  String tokenNumber;
  int tokenExpiration;

  UserModel({
    required this.userID,
    required this.parentID,
    required this.emailAddress,
    required this.fullName,
    required this.username,
    required this.password,
    this.role = 3,
    required this.level,
    required this.restriction,
    required this.picLoc,
    this.tokenNumber = 'none',
    this.tokenExpiration = 0,
  });

  // Convert from JSON (API response)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userID: int.parse(json['UserID']),
      parentID: int.parse(json['ParentID']),
      emailAddress: json['EmailAddress'],
      fullName: json['FullName'],
      username: json['Username'],
      password: json['Password'],
      role: int.parse(json['Role']),
      level: json['level'],
      restriction: int.parse(json['restriction']),
      picLoc: json['PicLoc'],
      tokenNumber: json['tokennumber'],
      tokenExpiration: int.parse(json['tokenexpiration']),
    );
  }

  // Convert to JSON for API requests
  Map<String, dynamic> toJson() {
    return {
      'UserID': userID,
      'ParentID': parentID,
      'EmailAddress': emailAddress,
      'FullName': fullName,
      'Username': username,
      'Password': password,
      'Role': role,
      'level': level,
      'restriction': restriction,
      'PicLoc': picLoc,
      'tokennumber': tokenNumber,
      'tokenexpiration': tokenExpiration,
    };
  }

  // Convert from Map (database)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userID: map['UserID'],
      parentID: map['ParentID'],
      emailAddress: map['EmailAddress'],
      fullName: map['FullName'],
      username: map['Username'],
      password: map['Password'],
      role: map['Role'],
      level: map['level'],
      restriction: map['restriction'],
      picLoc: map['PicLoc'],
      tokenNumber: map['tokennumber'],
      tokenExpiration: map['tokenexpiration'],
    );
  }

  // Convert to Map for database insertion
  Map<String, dynamic> toMap() {
    return {
      'UserID': userID,
      'ParentID': parentID,
      'EmailAddress': emailAddress,
      'FullName': fullName,
      'Username': username,
      'Password': password,
      'Role': role,
      'level': level,
      'restriction': restriction,
      'PicLoc': picLoc,
      'tokennumber': tokenNumber,
      'tokenexpiration': tokenExpiration,
    };
  }
}
