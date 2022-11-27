import 'User.dart';

/// status : "Success"
/// message : "Login Successful"
/// user : {"id":71,"first_name":"subornna","last_name":"akter","phone":"01921001218","email":"suborna@yahoo.com","verification_code":null,"verification_expire_at":null,"created_at":"2022-11-23T08:50:48.000000Z","updated_at":"2022-11-23T08:50:48.000000Z"}
/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMjQ1NjI4OWUyMjI5NDU2N2E1NWQyYWQ5NDZiOTQ4ZjdmYTQzZTEwNThmMGY2NjJiZjY5YzM3MDZjMDgyYzAyMDExNWIzODc3ZGViMGVlYjEiLCJpYXQiOjE2NjkxOTM5NDUuMjg0NjM2MDIwNjYwNDAwMzkwNjI1LCJuYmYiOjE2NjkxOTM5NDUuMjg0NjM4ODgxNjgzMzQ5NjA5Mzc1LCJleHAiOjE3MDA3Mjk5NDUuMjgxMDI0OTMyODYxMzI4MTI1LCJzdWIiOiI3MSIsInNjb3BlcyI6W119.SjxGo1wpJ6uxw7acDsAj2Yd9Dd2qP3x_zPuZ8o_iZkgdWVLwvvaMOfXexmZTR5GfimAwXXoNc9ROmxBc8_faS_XX9wZFP9r4PZ5fIwb_WZ_tXfK4OmP7FIEY7LFfZTsOoaFDaOiwdJjhYMzrxlNFRF1qE2D8fU_Fabf62o3fKB81kKm2X2MNMjGTUgucMa1kQGZFYfQR9qS06lZxoj_qDU7UJnOk8rxA3R7HjpiP-iZxz-wIjoqhhQ6oUBzmzsVSyRa7zuEOjd_fWKMDgxm-dsV_QV-dxD2HtIJJ3D-DrEtEA7OaPCrcdwIQw1rIvVwFSYKEqoCJcJbGlaoWLuh0QEFQC_1ADkIyzamTohfNAnwmdrUpLH1SOHz-DOD_yIcq7DTRmi6XDs3Uzm39ED1V2G9yRerWdLShX9GA8kwGJsf5D4FAw3cjQ9iObETSnSaX-CqGjFB9IniIV9AN45NC-USrBYqPA_bT5XHSP9GJkVMVwbF33I7tC80e9HEFjF2IXuD8lnRfjzpbn_V5keR5u6AHe_QkyDRuZXeN6oawQqoRK2F9Ps_MY9WgbL_Lt3xatDbYVlQOYL3uv6qNDf51xpF4yC6YYKsbpwOebK9Q5HkXsuuqlySwEukPCyPSvxhrtKKLekRBiPOaTpvWim_jIxfCuoWMjqVeQpW_BXD5at8"
/// token_type : "Bearer"
/// expires_at : "2023-11-23 08:59:05"

class SignInModel {
  SignInModel({
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

  SignInModel.fromJson(dynamic json) {
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