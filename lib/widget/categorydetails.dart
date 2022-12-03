
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:prothom_alo/Model/Category%20Details/CategoryDetailsModel.dart';
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
    return FutureBuilder<CategoryDetailsModel>(
        future: NewsPaperClass().getCategoryNewsdetails(widget.newsid),
        builder: (_,snapshot){
          if(snapshot.hasData){
            return Scaffold(
              body: SingleChildScrollView(
                child: ListView.builder(
                   physics: NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount: snapshot.data?.datas?.data?.length ?? 0,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 0,),
                            Text(snapshot.data?.datas?.data?[index].title ?? '',style: TextStyle(fontSize: 27,fontWeight: FontWeight.w500,fontFamily: 'Merriweather',color: Colors.black),),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(IconlyBold.time_circle,color: Colors.grey,),
                                SizedBox(width: 5,),
                                Text(snapshot.data?.datas?.data?[index].date ?? ''),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Image.network(snapshot.data?.datas?.data?[index].image?[0] ?? '',fit: BoxFit.cover,),
                            SizedBox(height: 5,),
                            Text(snapshot.data?.datas?.data?[index].summary ?? '',maxLines: 2,),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Text('By',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                                SizedBox(width: 5,),
                                Text(snapshot.data?.datas?.data?[index].newsCategory?? '',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),

                              ],
                            ),
                            SizedBox(height: 7,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('TODAY NEWS',style: TextStyle(color: Colors.grey[700]),),
                              ],
                            ),
                            Divider(
                              thickness: 1,
                              height: 50,
                              color: Colors.grey[700],
                            ),
                            Text(Bidi.stripHtmlIfNeeded(snapshot.data?.datas?.data?[index].description ?? ''),style: TextStyle(color: Colors.grey[800],fontSize: 16),textAlign: TextAlign.start,),
                            Divider(
                              thickness: 5,
                              color: Colors.red,
                              height: 50,
                            ),

                            SizedBox(height: 40,),
                          ],

                        ),
                      );
                    }),
              )
            );
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        });
  }
}
