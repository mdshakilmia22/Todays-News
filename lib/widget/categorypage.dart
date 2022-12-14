import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prothom_alo/Model/Category%20Model/CategoryNewModel.dart';
import 'package:prothom_alo/widget/categorydetails.dart';

import '../Config/riverpod.dart';
class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
      body: Consumer(
          builder: (_,ref,watch){
            AsyncValue<CategoryNewModel> firstcategory= ref.watch(categoryProvider);
            return firstcategory.when(
                data: (data){
                  return GridView.builder(
                      itemCount: data.datas?.data?.length ?? 0,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height/5,
                                      width: MediaQuery.of(context).size.width/2.3,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(15),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(data.datas!.data![index].image.toString()),
                                          )
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 130,left: 10),
                                        child: Text(data.datas!.data![index].name.toString(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                                      ),
                                    ),

                                  ],
                                ),
                              ]
                          ),
                        ).onTap(()=>CategoryDetailsPage(newsid: data.datas!.data![index].id.toString()).launch(context));
                      });

                },
                error: (e,stack){
                  return Text('Error');
                },
                loading: (){
                return  Center(child: CircularProgressIndicator(),);
                });
          }),
    );
  }
}
