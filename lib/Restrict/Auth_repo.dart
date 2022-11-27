
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prothom_alo/Config/news_config.dart';
import 'package:prothom_alo/Model/Sing_In/SignInModel.dart';
import 'package:prothom_alo/Model/Sing_Up/SingUpModels.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Config/config.dart';
import '../Model/Get_Model/GetModel.dart';

class AuthReop {
  Future<bool> SingUpwithEmail(String firstname,String lastname,String email, String phone, String password, String confarmPassword)async{
    final prefs = await SharedPreferences.getInstance();
    String url=Config.serverUrl + Config.sinUP;
    var response= await http.post(Uri.parse(url),body: {
      'first_name' : firstname,
      'last_name' : lastname,
      'phone'  : phone,
      'email' : email,
      'password' : password,
      'password_confirmation' :confarmPassword
    });
    var data=jsonDecode(response.body);
    if(response.statusCode==201){
      print("Code  : ${response.statusCode}");
      var decode= SingUpModels.fromJson(data);
      await prefs.setString('token', decode.message.toString());
      return true;
    }
    else{
      print("Code  : ${response.statusCode}");
      return false;
    }
  }

  Future<bool> SingInwithEmail(String email, String password)async{
    String url= Config.serverUrl + Config.singIn;
    final prefs = await SharedPreferences.getInstance();
    var response= await http.post(Uri.parse(url),body: <String, String>{
      'email' : email,
      'password' : password
    });
    var data= jsonDecode(response.body);
    if(response.statusCode==200){
      var decode= SignInModel.fromJson(data);
      await prefs.setString('token', decode.message.toString());
      return true;
    }
    else{
      return true;
    }
  }

  Future<bool> updateProfile(String firstName, String lastName, String email, String phone) async{
    final prefs = await SharedPreferences.getInstance();
    String? token=  prefs.get("token") as String?;
    var response= await http.post(Uri.parse(Config.profileUrl + Config.updateProfile),body: <String, String>{
      'first_name' : firstName,
      'last_name' : lastName,
      'email' : email,
      'phone' : phone
    },
      headers: <String, String>{
      'Authorization' : 'Bearer $token'
      }
    );
    if(response.statusCode==200){
      print('status code : ${response.statusCode}');
      return true;
    }
    else{
      print('statuscode : else ${response.statusCode}');
      return false;
    }
  }
}

class GetData{

  Future<GetModel> GetAllData()async{
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    String url = Config.serverUrl + Config.getdata;
    var responce = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token'
    });
    var data = jsonDecode(responce.body);
    if(responce.statusCode == 200){
      return GetModel.fromJson(data);
    }
    else  throw Exception('User Not Found');
  }
}
