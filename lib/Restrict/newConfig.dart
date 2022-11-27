import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prothom_alo/Config/news_config.dart';
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

  Future<SearchModel> getSearch()async{
    var response= await http.get(Uri.parse(NewsConfig.newsurl + NewsConfig.search));
    if(response.statusCode==200){
      return SearchModel.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception('Error');
    }
  }

}
