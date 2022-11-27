/// id : 71
/// first_name : "subornna"
/// last_name : "akter"
/// phone : "01921001218"
/// email : "suborna@yahoo.com"
/// verification_code : null
/// verification_expire_at : null
/// created_at : "2022-11-23T08:50:48.000000Z"
/// updated_at : "2022-11-23T08:50:48.000000Z"

class User {
  User({
      int? id, 
      String? firstName, 
      String? lastName, 
      String? phone, 
      String? email, 
      dynamic verificationCode, 
      dynamic verificationExpireAt, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _phone = phone;
    _email = email;
    _verificationCode = verificationCode;
    _verificationExpireAt = verificationExpireAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _phone = json['phone'];
    _email = json['email'];
    _verificationCode = json['verification_code'];
    _verificationExpireAt = json['verification_expire_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _firstName;
  String? _lastName;
  String? _phone;
  String? _email;
  dynamic _verificationCode;
  dynamic _verificationExpireAt;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get phone => _phone;
  String? get email => _email;
  dynamic get verificationCode => _verificationCode;
  dynamic get verificationExpireAt => _verificationExpireAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['phone'] = _phone;
    map['email'] = _email;
    map['verification_code'] = _verificationCode;
    map['verification_expire_at'] = _verificationExpireAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}