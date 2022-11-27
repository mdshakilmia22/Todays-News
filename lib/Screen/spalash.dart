import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prothom_alo/Screen/NewsPaper.dart';
import 'package:prothom_alo/Screen/sing_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpalashScreen extends StatefulWidget {
  const SpalashScreen({Key? key}) : super(key: key);

  @override
  State<SpalashScreen> createState() => _SpalashScreenState();
}

class _SpalashScreenState extends State<SpalashScreen> {

  Future<void> getData()async{
    final prefs = await SharedPreferences.getInstance();
    var token= prefs.getString('token');
    if(token.isEmptyOrNull){
      await Future.delayed(Duration(seconds: 2)).then((value) => SingInPage().launch(context));
    }
    else{
      await Future.delayed(Duration(seconds: 2));
      Newspaper().launch(context);
    }
  }
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/timezone.png',height: 60,width: 60,),
                const Text('Todays Time',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.red,fontFamily: 'Merriweather'),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
