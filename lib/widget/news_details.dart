import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prothom_alo/Extract%20Widget/feature.dart';
import 'package:prothom_alo/Restrict/newConfig.dart';
import 'package:intl/intl.dart';
import '../Config/riverpod.dart';
import '../NewsDetails/NewsDetailsModel.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({required this.newsid});
  final String newsid;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (_,ref,watch){
          AsyncValue<NewsDetailsModel> newdetails=ref.watch(detailsNewsProvider(widget.newsid));
          return newdetails.when(
              data: (details){
                return Scaffold(
                    extendBodyBehindAppBar: true,
                    appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          FeaturePage(
                              image: details.data?.image?[0].toString() ?? '',
                              title: details.data?.title ?? ''),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(color: Colors.red),
                                  child: Text(details.data?.newsCategory ?? '',style: TextStyle(color: Colors.white),),
                                ),
                                Spacer(),
                                Text(details.data?.reporterName ?? '',style: TextStyle(color: Colors.black),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(Bidi.stripHtmlIfNeeded(details.data?.description ?? ''),style: TextStyle(color: Colors.black,fontSize: 16.0),),
                          )
                        ],
                      ),
                    )
                );
              },
              error: (e,stack){
                return Text('Error');
              },
              loading: (){
                return Center(child: CircularProgressIndicator(),);
              });
        });
  }
}
// return Scaffold(
// extendBodyBehindAppBar: true,
// appBar: AppBar(
// backgroundColor: Colors.transparent,
// elevation: 0.0,
// ),
// body: SingleChildScrollView(
// child: Column(
// children: [
// FeaturePage(
// image: snapshot.data?.data?.image?[0].toString() ?? '',
// title: snapshot.data?.data?.title ?? ''),
// Padding(
// padding: const EdgeInsets.all(10.0),
// child: Row(
// children: [
// Container(
// padding: EdgeInsets.all(10.0),
// decoration: BoxDecoration(color: Colors.red),
// child: Text(snapshot.data?.data?.newsCategory ?? '',style: TextStyle(color: Colors.white),),
// ),
// Spacer(),
// Text(snapshot.data?.data?.reporterName ?? '',style: TextStyle(color: Colors.black),)
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(10.0),
// child: Text(Bidi.stripHtmlIfNeeded(snapshot.data?.data?.description ?? ''),style: TextStyle(color: Colors.black,fontSize: 16.0),),
// )
// ],
// ),
// )
// );