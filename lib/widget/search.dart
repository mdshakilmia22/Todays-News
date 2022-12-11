import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prothom_alo/Model/Search%20Model/SearchModel.dart';
import '../Extract Widget/feature.dart';
import '../Extract Widget/newscard.dart';
import '../Repository/newConfig.dart';
import 'news_details.dart';

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
  return  SafeArea(
    child: Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: SizedBox(
                  height: 60,
                  // color: Colors.red,
                  width: double.infinity,
                  child: TextField(
                    onSubmitted: (value){
                      setState(() {
                        search=value;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.search,color: Colors.grey,size: 25,).onTap(()async{
                        await NewsPaperClass().getSearch(search!);
                      }),
                      hintText: 'Search',
                      suffixIcon: const Icon(Icons.mic,color: Colors.grey,),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            FutureBuilder<SearchModel>(
                future: NewsPaperClass().getSearch(search ?? ''),
                builder: (context, snapshot){
                  if(snapshot.hasData && !search.isEmptyOrNull){
                    if(snapshot.data!.datas!.data!.isEmpty){
                      return const Center(child: Text('No Data Found'),);
                    } else{
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
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
                  } else if(search.isEmptyOrNull){
                    return const Center(child: Text('Waiting For your Search Query'),);
                  }
                  else{
                    return const Padding(
                      padding: EdgeInsets.only(top: 250),
                      child: Center(child: CircularProgressIndicator(),),
                    );
                  }
                }),
          ],
        ),
      )
      ),
  );
  }
}

