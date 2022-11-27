import 'Comments.dart';

/// id : 22
/// title : "New york to attend 76th United nations general assembly"
/// summary : "This is the premier’s first foreign tour after a year and a half since she visited Italy in February 2020 before the coronavirus pandemic lockdowns began"
/// description : "<div class=\"highlighted-content\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-size: 20px; font-family: roboto, sans-serif, &quot;siyam rupali&quot;; letter-spacing: 0.5px; white-space: pre-line;\"><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px;\">This is the premier’s first foreign tour after a year and a half since she visited Italy in February 2020 before the coronavirus pandemic lockdowns began</p></div><span style=\"color: rgb(0, 0, 0); font-family: roboto, sans-serif, &quot;siyam rupali&quot;; letter-spacing: 0.5px; white-space: pre-line;\">\r\n</span><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; color: rgb(0, 0, 0); font-family: roboto, sans-serif, &quot;siyam rupali&quot;; letter-spacing: 0.5px; white-space: pre-line;\">Prime Minister Sheikh Hasina reached the USA on Sunday evening to attend the 76th United Nations General Assembly (UNGA).</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; color: rgb(0, 0, 0); font-family: roboto, sans-serif, &quot;siyam rupali&quot;; letter-spacing: 0.5px; white-space: pre-line;\">\"A VVIP chartered flight of Biman Bangladesh Airlines (BG-1902) carrying the premier and her entourage members arrived at 5:40pm (local time) on Sunday in the John F Kennedy International Airport in New York,\" Prime Minister's Press Secretary Ihsanul Karim told BSS.<span style=\"font-size: 1rem;\">Bangladesh Ambassador to the USA M Shahidul Isalm and Bangladesh Permanent Representative to the United Nations (UN) Ambassador Rabab Fatima received the premier at the airport, he said.</span></p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; color: rgb(0, 0, 0); font-family: roboto, sans-serif, &quot;siyam rupali&quot;; letter-spacing: 0.5px; white-space: pre-line;\">Foreign Minister Dr A K Abdul Momen, and State Minister for Foreign Affairs Md Shahriar Alam, among others, are accompanying the prime minister.</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; color: rgb(0, 0, 0); font-family: roboto, sans-serif, &quot;siyam rupali&quot;; letter-spacing: 0.5px; white-space: pre-line;\">A ceremonial motorcade later escorted Sheikh Hasina to Lotte New York Palace where she will be staying during her stay in the USA.</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; color: rgb(0, 0, 0); font-family: roboto, sans-serif, &quot;siyam rupali&quot;; letter-spacing: 0.5px; white-space: pre-line;\">After a two-day stopover in Helsinki, the premier left the Helsinki-Vantaa Airport for New York at 4:16 pm (Finnish capital time).</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; color: rgb(0, 0, 0); font-family: roboto, sans-serif, &quot;siyam rupali&quot;; letter-spacing: 0.5px; white-space: pre-line;\">Earlier, on September 17, Prime Minister Sheikh Hasina reached Helsinki en route to New York, USA to attend the 76th UNGA.</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; color: rgb(0, 0, 0); font-family: roboto, sans-serif, &quot;siyam rupali&quot;; letter-spacing: 0.5px; white-space: pre-line;\">The premier and her entourage members departed from the Hazrat Shahjalal International Airport (HSIA), Dhaka for Helsinki at 9:23 am on the same day.</p>"
/// image : ["http://maannews.maantechnology.com/public/uploads/images/newsimages/maannewsimage19102021_123338_55920270_303.jpg"]
/// date : "2021-09-20"
/// news_subcategory : "World"
/// news_category : "World"
/// news_categoryslug : "world-news"
/// reporter_name : "Reporter 21"
/// viewers : 1
/// comments : [{"id":3,"news_id":22,"name":"Check21","email":"check21@gmail.com","comment":"A ceremonial motorcade later escorted Sheikh Hasina to Lotte New York Palace where she will be staying during her stay in the USA.","created_at":"2021-10-04T05:55:51.000000Z","updated_at":"2021-10-04T05:55:51.000000Z"}]

class Data {
  Data({
      int? id, 
      String? title, 
      String? summary, 
      String? description, 
      List<String>? image, 
      String? date, 
      String? newsSubcategory, 
      String? newsCategory, 
      String? newsCategoryslug, 
      String? reporterName, 
      int? viewers, 
      List<Comments>? comments,}){
    _id = id;
    _title = title;
    _summary = summary;
    _description = description;
    _image = image;
    _date = date;
    _newsSubcategory = newsSubcategory;
    _newsCategory = newsCategory;
    _newsCategoryslug = newsCategoryslug;
    _reporterName = reporterName;
    _viewers = viewers;
    _comments = comments;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _summary = json['summary'];
    _description = json['description'];
    _image = json['image'] != null ? json['image'].cast<String>() : [];
    _date = json['date'];
    _newsSubcategory = json['news_subcategory'];
    _newsCategory = json['news_category'];
    _newsCategoryslug = json['news_categoryslug'];
    _reporterName = json['reporter_name'];
    _viewers = json['viewers'];
    if (json['comments'] != null) {
      _comments = [];
      json['comments'].forEach((v) {
        _comments?.add(Comments.fromJson(v));
      });
    }
  }
  int? _id;
  String? _title;
  String? _summary;
  String? _description;
  List<String>? _image;
  String? _date;
  String? _newsSubcategory;
  String? _newsCategory;
  String? _newsCategoryslug;
  String? _reporterName;
  int? _viewers;
  List<Comments>? _comments;
Data copyWith({  int? id,
  String? title,
  String? summary,
  String? description,
  List<String>? image,
  String? date,
  String? newsSubcategory,
  String? newsCategory,
  String? newsCategoryslug,
  String? reporterName,
  int? viewers,
  List<Comments>? comments,
}) => Data(  id: id ?? _id,
  title: title ?? _title,
  summary: summary ?? _summary,
  description: description ?? _description,
  image: image ?? _image,
  date: date ?? _date,
  newsSubcategory: newsSubcategory ?? _newsSubcategory,
  newsCategory: newsCategory ?? _newsCategory,
  newsCategoryslug: newsCategoryslug ?? _newsCategoryslug,
  reporterName: reporterName ?? _reporterName,
  viewers: viewers ?? _viewers,
  comments: comments ?? _comments,
);
  int? get id => _id;
  String? get title => _title;
  String? get summary => _summary;
  String? get description => _description;
  List<String>? get image => _image;
  String? get date => _date;
  String? get newsSubcategory => _newsSubcategory;
  String? get newsCategory => _newsCategory;
  String? get newsCategoryslug => _newsCategoryslug;
  String? get reporterName => _reporterName;
  int? get viewers => _viewers;
  List<Comments>? get comments => _comments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['summary'] = _summary;
    map['description'] = _description;
    map['image'] = _image;
    map['date'] = _date;
    map['news_subcategory'] = _newsSubcategory;
    map['news_category'] = _newsCategory;
    map['news_categoryslug'] = _newsCategoryslug;
    map['reporter_name'] = _reporterName;
    map['viewers'] = _viewers;
    if (_comments != null) {
      map['comments'] = _comments?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}