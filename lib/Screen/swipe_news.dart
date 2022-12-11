import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:prothom_alo/Config/riverpod.dart';
import 'package:prothom_alo/Model/LatestNews/LatestNewsModel.dart';
import 'package:prothom_alo/NewsDetails/NewsDetailsModel.dart';
class SwipePage extends StatefulWidget {
  const SwipePage({super.key});

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
           builder: (_,ref,watch) {
             AsyncValue<LatestNewsModel> latest= ref.watch(latestProvider);
             return latest.when(
                 data: (latestnews){
                   return PageView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: latestnews.datas?.data?.length ?? 0,
                       itemBuilder: (_,index){
                        return Scaffold(
                          extendBodyBehindAppBar: true,
                          extendBody: true,
                          appBar: AppBar(
                             leading: Icon(Icons.arrow_back,color: Colors.white,),
                            elevation: 0.0,
                            backgroundColor: Colors.transparent,
                          ),
                        body: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              child: Image.network(latestnews.datas!.data![index].image![0].toString(),),
                            ),
                            Text(latestnews.datas!.data![index].title.toString(),overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,fontFamily: 'Merriweather'),),
                            SizedBox(height: 30,),
                            Consumer(builder: (_,ref,watch){
                              AsyncValue<NewsDetailsModel> detailsNews=ref.watch(detailsNewsProvider(latestnews.datas!.data![index].id));
                              return detailsNews.when(
                                  data: (detail){
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 30,),
                                          Text(Bidi.stripHtmlIfNeeded(detail.data!.description.toString()).substring(0,500),style: TextStyle(fontSize: 16,color: Colors.black),),

                                          SizedBox(height: 30,),

                                          Text('Swipe left for more at inistagram/few hours ago',style: TextStyle(color: Colors.grey),)
                                        ],
                                      ),
                                    );
                                  },
                                  error: (e,stack){
                                    return Text('Error');
                                  }, 
                                  loading: (){
                                    return Center(child: CircularProgressIndicator());
                                  });
                            })
                          ],
                        ),
                        );
                       });
                 },
                 error: (e,stack){
                   return Text('Error');
                 },
                 loading: (){
                   return Center(child: CircularProgressIndicator());
                 });
           },
    );
  }
}
