import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:prothom_alo/NewsDetails/NewsDetailsModel.dart';
import 'package:prothom_alo/Restrict/newConfig.dart';

class CategoryDetailsPage extends StatefulWidget {
  const CategoryDetailsPage({super.key, required this.newsid});
  final String newsid;

  @override
  State<CategoryDetailsPage> createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsDetailsModel>(
        future: NewsPaperClass().detailsNews(widget.newsid),
        builder: (_,snapshot){
          if(snapshot.hasData){
            return Scaffold(
              body: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 0,),
                          Text(snapshot.data?.data?.title ?? '',style: TextStyle(fontSize: 27,fontWeight: FontWeight.w500,fontFamily: 'Merriweather',color: Colors.black),),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(IconlyBold.time_circle,color: Colors.grey,),
                              SizedBox(width: 5,),
                              Text(snapshot.data?.data?.date ?? ''),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Image.network(snapshot.data?.data?.image?[0] ?? '',fit: BoxFit.cover,),
                          SizedBox(height: 5,),
                          Text(snapshot.data?.data?.summary ?? '',maxLines: 2,),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Text('By',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                              SizedBox(width: 5,),
                              Text(snapshot.data?.data?.newsSubcategory ?? '',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),

                            ],
                          ),
                          SizedBox(height: 5,),
                          Text('BBC NEWS',style: TextStyle(color: Colors.grey[700]),),
                          Divider(
                            thickness: 1,
                            height: 50,
                            color: Colors.grey[700],
                          ),
                          Text(Bidi.stripHtmlIfNeeded(snapshot.data?.data?.description ?? ''),style: TextStyle(color: Colors.grey[800],fontSize: 16),textAlign: TextAlign.start,),
                          Divider(
                            thickness: 5,
                            color: Colors.red,
                            height: 50,
                          ),
                          Text('Related Topois',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Sport',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w400,fontSize: 17,fontFamily: 'Merriweather'),),
                              SizedBox(height: 10,),
                              Text('FootBall',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w400,fontSize: 17,fontFamily: 'Merriweather'),),
                              SizedBox(height: 10,),
                              Text('FIFA World Cup',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w400,fontSize: 17,fontFamily: 'Merriweather'),),
                            ],
                          ),
                          SizedBox(height: 40,),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Copyright @ 2022 BBC',),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )

                ],
              ),
            );
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        });
  }
}
