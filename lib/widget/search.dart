import 'package:flutter/material.dart';
class SearchPage extends StatefulWidget {
  const SearchPage();

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
  return  Scaffold(
    backgroundColor: Colors.grey[200],
    body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Card(

            child: SizedBox(
              height: 60,
              // color: Colors.red,
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search,color: Colors.grey,size: 25,),
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

