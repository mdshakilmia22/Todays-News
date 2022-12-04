import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prothom_alo/Config/riverpod.dart';
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
        child: Consumer(
            builder: (_,ref,watch){
              AsyncValue<LatestNewsModel> latest=ref.watch(latestProvider);
              return latest.when(
                  data: (data){
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: data.datas?.data?.length ?? 0,
                        itemBuilder: (context,index){
                          return Column(
                            children: [
                              FeaturePage(
                                  image: data.datas?.data?[index].image?[0] ?? '',
                                  title: data.datas?.data?[index].title ?? '').visible(index==0),

                              NewCard(
                                image: data.datas?.data?[index].image?[0] ?? '',
                                title: data.datas?.data?[index].title ?? '',
                                date: data.datas?.data?[index].date ?? '',
                              ).visible(index !=0),

                            ],
                          ).onTap(() => DetailsPage(newsid: data.datas!.data![index].id.toString(),).launch(context));
                        });
                  },
                  error: (e,stack){
                    return Text('Error');
                  }, loading: (){
                    return Center(child: CircularProgressIndicator(),);
              });
            }),
      ),
    );
  }
}

