import 'Data.dart';

/// success : true
/// message : "Loaded Successfully"
/// data : {"id":22,"title":"New york to attend 76th United nations general assembly","summary":"This is the premier’s first foreign tour after a year and a half since she visited Italy in February 2020 before the coronavirus pandemic lockdowns began","description":"<div class=\"highlighted-content\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-size: 20px; font-family: roboto, sans-serif, &quot;siyam rupali&quot;; letter-spacing: 0.5px; white-space: pre-line;\"><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px;\">This is the premier’s first foreign tour after a year and a half since she visited Italy in February 2020 before the coronavirus pandemic lockdowns began</p></div><span style=\"color: rgb(0, 0, 0); font-family: roboto, sans-serif, &quot;siyam rupali&quot;; letter-spacing: 0.5px; white-space: pre-line;\">\r\n</span><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; color: rgb(0, 0, 0); font-family: roboto, sans-serif, &quot;siyam rupali&quot;; letter-spacing: 0.5px; white-space: pre-line;\">Prime Minister Sheikh Hasina reached the USA on Sunday evening to attend the 76th United Nations General Assembly (UNGA).</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; color: rgb(0, 0, 0); font-family: roboto, sans-serif, &quot;siyam rupali&quot;; letter-spacing: 0.5px; white-space: pre-line;\">\"A VVIP chartered flight of Biman Bangladesh Airlines (BG-1902) carrying the premier and her entourage members arrived at 5:40pm (local time) on Sunday in the John F Kennedy International Airport in New York,\" Prime Minister's Press Secretary Ihsanul Karim told BSS.<span style=\"font-size: 1rem;\">Bangladesh Ambassador to the USA M Shahidul Isalm and Bangladesh Permanent Representative to the United Nations (UN) Ambassador Rabab Fatima received the premier at the airport, he said.</span></p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; color: rgb(0, 0, 0); font-family: roboto, sans-serif, &quot;siyam rupali&quot;; letter-spacing: 0.5px; white-space: pre-line;\">Foreign Minister Dr A K Abdul Momen, and State Minister for Foreign Affairs Md Shahriar Alam, among others, are accompanying the prime minister.</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; color: rgb(0, 0, 0); font-family: roboto, sans-serif, &quot;siyam rupali&quot;; letter-spacing: 0.5px; white-space: pre-line;\">A ceremonial motorcade later escorted Sheikh Hasina to Lotte New York Palace where she will be staying during her stay in the USA.</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; color: rgb(0, 0, 0); font-family: roboto, sans-serif, &quot;siyam rupali&quot;; letter-spacing: 0.5px; white-space: pre-line;\">After a two-day stopover in Helsinki, the premier left the Helsinki-Vantaa Airport for New York at 4:16 pm (Finnish capital time).</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; color: rgb(0, 0, 0); font-family: roboto, sans-serif, &quot;siyam rupali&quot;; letter-spacing: 0.5px; white-space: pre-line;\">Earlier, on September 17, Prime Minister Sheikh Hasina reached Helsinki en route to New York, USA to attend the 76th UNGA.</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; color: rgb(0, 0, 0); font-family: roboto, sans-serif, &quot;siyam rupali&quot;; letter-spacing: 0.5px; white-space: pre-line;\">The premier and her entourage members departed from the Hazrat Shahjalal International Airport (HSIA), Dhaka for Helsinki at 9:23 am on the same day.</p>","image":["http://maannews.maantechnology.com/public/uploads/images/newsimages/maannewsimage19102021_123338_55920270_303.jpg"],"date":"2021-09-20","news_subcategory":"World","news_category":"World","news_categoryslug":"world-news","reporter_name":"Reporter 21","viewers":1,"comments":[{"id":3,"news_id":22,"name":"Check21","email":"check21@gmail.com","comment":"A ceremonial motorcade later escorted Sheikh Hasina to Lotte New York Palace where she will be staying during her stay in the USA.","created_at":"2021-10-04T05:55:51.000000Z","updated_at":"2021-10-04T05:55:51.000000Z"}]}

class NewsDetailsModel {
  NewsDetailsModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  NewsDetailsModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
NewsDetailsModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => NewsDetailsModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}