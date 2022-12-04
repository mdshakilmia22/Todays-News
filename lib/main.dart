import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prothom_alo/Screen/NewsPaper.dart';
import 'package:prothom_alo/Screen/sing_in.dart';
import 'package:prothom_alo/Screen/spalash.dart';
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
      home: const Newspaper(),
    );
  }
}
