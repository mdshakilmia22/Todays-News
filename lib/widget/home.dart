import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prothom_alo/Model/LatestNews/LatestNewsModel.dart';
import 'package:prothom_alo/Restrict/newConfig.dart';
import 'package:prothom_alo/widget/news_details.dart';
import '../Extract Widget/feature.dart';
import '../Extract Widget/newscard.dart';
class LatestNewsPage extends StatefulWidget {
  const LatestNewsPage({Key? key}) : super(key: key);

  @override
  State<LatestNewsPage> createState() => _LatestNewsPageState();
}

class _LatestNewsPageState extends State<LatestNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/timezone.png',height: 25,width: 25),
        ),
        title:  Padding(
          padding: const EdgeInsets.all(0),
          child: Text('Todays Time',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red,fontFamily: 'Merriweather'),),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications,size: 35,color: Colors.grey[600],),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<LatestNewsModel>(
            future: NewsPaperClass().latestNews(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.datas?.data?.length ?? 0,
                    itemBuilder: (context,index){
                      return Column(
                        children: [
                          FeaturePage(
                              image: snapshot.data?.datas?.data?[index].image?[0] ?? '',
                              title: snapshot.data?.datas?.data?[index].title ?? '').visible(index==0),

                          NewCard(
                              image: snapshot.data?.datas?.data?[index].image?[0] ?? '',
                              title: snapshot.data?.datas?.data?[index].title ?? '',
                              date: snapshot.data?.datas?.data?[index].date ?? '',
                          ).visible(index !=0),

                        ],
                      ).onTap(() => DetailsPage(newsid: snapshot.data!.datas!.data![index].id.toString(),).launch(context));
                    });
              }
              else{
                return Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: Center(child: CircularProgressIndicator(),),
                );
              }
            }),
      ),
    );
  }
}

