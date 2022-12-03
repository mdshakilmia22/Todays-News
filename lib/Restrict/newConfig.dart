import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prothom_alo/Config/config.dart';
import 'package:prothom_alo/Config/news_config.dart';
import 'package:prothom_alo/Model/Category%20Details/CategoryDetailsModel.dart';
import '../Model/Category Model/CategoryNewModel.dart';
import '../Model/LatestNews/LatestNewsModel.dart';
import '../Model/Search Model/SearchModel.dart';
import '../NewsDetails/NewsDetailsModel.dart';

class NewsPaperClass{

  Future<LatestNewsModel> latestNews()async{
    var response= await http.get(Uri.parse(NewsConfig.newsurl + NewsConfig.newslatest));
    var data= jsonDecode(response.body);
    if(response.statusCode==200){
     return LatestNewsModel.fromJson(data);
    }
    else{
      throw Exception('Error');
    }
  }
  Future<NewsDetailsModel> detailsNews(String id)async{
    var response= await http.get(Uri.parse('${NewsConfig.newsurl + NewsConfig.newsDetails}/$id'));
    var data= jsonDecode(response.body);
    if(response.statusCode==200){
      return NewsDetailsModel.fromJson(data);
    }
    else{
      throw Exception('Eroor');
    }
  }

  Future<CategoryNewModel> getcategory()async{
    var response= await http.get(Uri.parse(NewsConfig.newsurl + NewsConfig.categoryNews));
    if(response.statusCode==200){
      return CategoryNewModel.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception('Error');
    }

  }

  Future<SearchModel> getSearch(String item)async{
    var response= await http.post(Uri.parse(NewsConfig.newsurl + NewsConfig.search),body: <String, String>{
      'search' : item
    });
    if(response.statusCode==200){
      return SearchModel.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception('Error');
    }
  }

  Future<bool> signOut(String token)async{
    var response= await http.get(Uri.parse(Config.serverUrl + Config.logoutProfile),headers: <String, String>{
      'Authorization' : 'Bearer $token'
    });
    if(response.statusCode==200){
      return true;

    }
    else{
      throw Exception('Error');
    }
  }


 Future<CategoryDetailsModel> getCategoryNewsdetails(String id)async{
    var response= await http.get(Uri.parse('${NewsConfig.newsurl + NewsConfig.categoryDetails}/$id'));
    var data= jsonDecode(response.body);
    if(response.statusCode==200){
      return CategoryDetailsModel.fromJson(data);
    }
    else{
      throw Exception('Error');
    }
 }

}
