
/// status : "Success"
/// message : "Registration Successful"
/// user : {"first_name":"rony","last_name":"islam","phone":"01970665599","email":"rony@yahoo.com","updated_at":"2022-11-23T09:13:45.000000Z","created_at":"2022-11-23T09:13:45.000000Z","id":72}
/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiN2JlMTYxNWE4MWJhOTU5ZTYzM2EzNWY5YjE2YmU2NGYyMzYzNGRhYjU5NWMxMGMyNzRhNjNlNTUwMTgzNzJhYzg4N2Q3ZTBiMTFhYmE0M2QiLCJpYXQiOjE2NjkxOTQ4MjUuOTk1OTAxMTA3Nzg4MDg1OTM3NSwibmJmIjoxNjY5MTk0ODI1Ljk5NTkwMzk2ODgxMTAzNTE1NjI1LCJleHAiOjE3MDA3MzA4MjUuOTkyNDkyOTE0MTk5ODI5MTAxNTYyNSwic3ViIjoiNzIiLCJzY29wZXMiOltdfQ.AMrc0MYy73je00_u1wshpfV7D_lfzwub-UiKHjFIphZx82HvJVrM445VIV4o9z2aoId45K45LdVwU5sZfLQ5Ulq0ZYMcICqrMB2zOnCH1pXkwuwDNzGmzwFpJPeRXO-mOivw5Br-pXwbo31DxFQuAp61eMF-7gDS8W55AkRHabYkTHSFrnTritbDg1TebYKWkbcAPxlP-BZm4Hlw2l31r3eRANAsv84gbAq0IGQEQUMEnre_aCLsUsQHPsOWbJ8MZUDrZzAe44t1PeqJoJUWyHO8fj6Ix30SWMbtce2ITKoMaA9ZIg8zNHWGSd4lMajKHQiugoF_pWIeOxldDQ-DZNmNYzI-yP85TTKO2pV6ax9dHQR20F_zuzSs25mUfsYbS2syE71vvKv0cXGCIxySO-BD2P1HKoWpXWpoZdU9YL9TvFAqbeS9deFfmKO3A5uHCyTY-O3p_CY0R-kVmwkDQBHfxfOePAnyiPrlgYlCf0dip61shuh9s2Zz3_UM_lDCtFvo5P9GtezHUM2y7-GRZ1qHwhKXRgVlBs3HY6h23EPp-R7DR-FlaqlKSIbwMtpvWlvREa9PUuhuHdDsHM7juM0a7tS62eqobjKPLpZUlA4w3wGmERozICUjQ0rO1r_Ei6loJQBFmgGc69cMT6QIEYrpkvLEhLvQ8Cg-0kbxBsY"
/// token_type : "Bearer"
/// expires_at : "2023-11-23 09:13:45"
class SingUpModels {
  SingUpModels({
      String? status, 
      String? message, 
      User? user, 
      String? accessToken, 
      String? tokenType, 
      String? expiresAt,}){
    _status = status;
    _message = message;
    _user = user;
    _accessToken = accessToken;
    _tokenType = tokenType;
    _expiresAt = expiresAt;
}

  SingUpModels.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
    _expiresAt = json['expires_at'];
  }
  String? _status;
  String? _message;
  User? _user;
  String? _accessToken;
  String? _tokenType;
  String? _expiresAt;
SingUpModels copyWith({  String? status,
  String? message,
  User? user,
  String? accessToken,
  String? tokenType,
  String? expiresAt,
}) => SingUpModels(  status: status ?? _status,
  message: message ?? _message,
  user: user ?? _user,
  accessToken: accessToken ?? _accessToken,
  tokenType: tokenType ?? _tokenType,
  expiresAt: expiresAt ?? _expiresAt,
);
  String? get status => _status;
  String? get message => _message;
  User? get user => _user;
  String? get accessToken => _accessToken;
  String? get tokenType => _tokenType;
  String? get expiresAt => _expiresAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['access_token'] = _accessToken;
    map['token_type'] = _tokenType;
    map['expires_at'] = _expiresAt;
    return map;
  }

}
class User {
  User({
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
    String? updatedAt,
    String? createdAt,
    int? id,}){
    _firstName = firstName;
    _lastName = lastName;
    _phone = phone;
    _email = email;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
  }

  User.fromJson(dynamic json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _phone = json['phone'];
    _email = json['email'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _firstName;
  String? _lastName;
  String? _phone;
  String? _email;
  String? _updatedAt;
  String? _createdAt;
  int? _id;
  User copyWith({  String? firstName,
    String? lastName,
    String? phone,
    String? email,
    String? updatedAt,
    String? createdAt,
    int? id,
  }) => User(  firstName: firstName ?? _firstName,
    lastName: lastName ?? _lastName,
    phone: phone ?? _phone,
    email: email ?? _email,
    updatedAt: updatedAt ?? _updatedAt,
    createdAt: createdAt ?? _createdAt,
    id: id ?? _id,
  );
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get phone => _phone;
  String? get email => _email;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['phone'] = _phone;
    map['email'] = _email;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}