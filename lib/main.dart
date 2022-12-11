import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prothom_alo/Screen/spalash.dart';
import 'package:prothom_alo/Screen/swipe_news.dart';
void main(){
  runApp( const ProviderScope(child: myApp()));
}
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: SwipePage(),
    );
  }
}
