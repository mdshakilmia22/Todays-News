import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prothom_alo/Config/riverpod.dart';
import 'package:prothom_alo/Model/Category%20Details/CategoryDetailsModel.dart';
import 'package:prothom_alo/NewsDetails/NewsDetailsModel.dart';
import 'package:prothom_alo/Restrict/newConfig.dart';
import 'package:prothom_alo/widget/categorylast.dart';

class CategoryDetailsPage extends StatefulWidget {
  const CategoryDetailsPage({super.key, required this.newsid});
  final String newsid;

  @override
  State<CategoryDetailsPage> createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer(builder: (_, ref, watch) {
        AsyncValue<CategoryDetailsModel> first =
            ref.watch(categoryDetailsP(widget.newsid));
        return first.when(data: (paper) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: paper.datas?.data?.length ?? 0,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Stack(alignment: Alignment.bottomLeft, children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  paper.datas?.data?[index].image?[0] ?? ''))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        paper.datas!.data![index].title.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ]),
                ).onTap(()=>RiverPordDetails(endid: paper.datas!.data![index].id.toString()).launch(context));
              });
        }, error: (e, stack) {
          return const Text('Error');
        }, loading: () {
          return Padding(
            padding: const EdgeInsets.only(top: 300),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
      }),
    );
  }
}


