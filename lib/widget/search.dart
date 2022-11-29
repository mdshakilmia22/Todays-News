import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prothom_alo/Model/Search%20Model/SearchModel.dart';
import 'package:prothom_alo/Restrict/newConfig.dart';
class SearchPage extends StatefulWidget {
  const SearchPage();

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? search;
  TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
  return  Scaffold(
    backgroundColor: Colors.grey[200],
    body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Card(
            child: SizedBox(
              height: 60,
              // color: Colors.red,
              width: double.infinity,
              child: TextField(
                onChanged: (value){
                  setState(() {
                    search=value;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search,color: Colors.grey,size: 25,).onTap(()async{
                    await NewsPaperClass().getSearch(search!);
                  }),
                  hintText: 'Search',
                  suffixIcon: Icon(Icons.mic,color: Colors.grey,),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),)
    );
  }
}

