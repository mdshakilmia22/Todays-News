/// status : "Success"
/// message : "You have been successfully logged out"

class GetModel {
  GetModel({
      String? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  GetModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  String? _status;
  String? _message;
GetModel copyWith({  String? status,
  String? message,
}) => GetModel(  status: status ?? _status,
  message: message ?? _message,
);
  String? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}