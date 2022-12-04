import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:prothom_alo/Config/riverpod.dart';
import 'package:prothom_alo/NewsDetails/NewsDetailsModel.dart';


class RiverPordDetails extends StatefulWidget {
  const RiverPordDetails({super.key, required this.endid});
  final String endid;
  @override
  State<RiverPordDetails> createState() => _RiverPordDetailsState();
}

class _RiverPordDetailsState extends State<RiverPordDetails> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (_,ref,watch){
          AsyncValue<NewsDetailsModel> details= ref.watch(detailsNewsProvider(widget.endid));
          return details.when(
              data: (paper){

                return Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: AppBar(
                    elevation: 0.0,
                    backgroundColor: Colors.transparent,
                  ),
                  body: RefreshIndicator(
                    onRefresh: () async=>ref.refresh(categoryDetailsP(widget.endid)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.network(paper.data?.image?[0] ?? '',fit: BoxFit.cover,),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(paper.data!.title.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,fontFamily: 'Merriweather',color: Colors.black),),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Icon(IconlyBold.time_circle,color: Colors.grey,),
                                    SizedBox(width: 5,),
                                    Text(paper.data!.date.toString()),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    const Text('By',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                                    SizedBox(width: 5,),
                                    Text(paper.data?.newsCategory?? '',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),

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
                                Text(Bidi.stripHtmlIfNeeded(paper.data?.description ?? ''),style: TextStyle(color: Colors.grey[800],fontSize: 16),textAlign: TextAlign.start,),
                                const Divider(
                                  thickness: 5,
                                  color: Colors.red,
                                  height: 50,
                                ),
                                SizedBox(height: 15,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(child: Text('Copyright @ 2022 Today News')),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],

                      ),
                            )
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
