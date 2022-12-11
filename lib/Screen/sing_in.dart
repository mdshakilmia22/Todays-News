import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prothom_alo/Screen/NewsPaper.dart';
import 'package:prothom_alo/Screen/sign_up.dart';

import '../Repository/Auth_repo.dart';

class SingInPage extends StatefulWidget {
  const SingInPage({Key? key}) : super(key: key);

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontoller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/timezone.png',height: 60,width: 60,),
                    Text('Todays Time',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.red,fontFamily: 'Merriweather'),)
                  ],
                ),
                SizedBox(height: 30,),
                InkWell(
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Image.asset('images/google.png',height: 35,width: 35,fit: BoxFit.cover,),
                        const SizedBox(width: 10,),
                         Text('Login with Google',style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w500,fontSize: 18,fontFamily: 'Merriweather'),)
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('or',style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold,fontSize: 25),),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 50,
                  child: AppTextField(
                    textAlignVertical: TextAlignVertical.bottom,
                      textFieldType: TextFieldType.EMAIL,
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 5,
                            color: Colors.teal,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 50,
                  child: AppTextField(
                    textAlignVertical: TextAlignVertical.bottom,
                    textFieldType: TextFieldType.PASSWORD,
                    controller: passwordcontoller,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange,
                        ),
                        onPressed: ()async{
                          if(emailcontroller.text.isEmpty){
                            toast('Enter Your Email Address');
                          }
                          else if(passwordcontoller.text.isEmpty){
                            toast('Enter Your Password');
                          }
                          else if(passwordcontoller.text.length<6){
                            toast('Password at least 6 digit');
                          }
                          else{
                            try{
                              EasyLoading.show(status: 'Singing In...');
                              bool status= await AuthReop().SingInwithEmail(emailcontroller.text, passwordcontoller.text);
                              if(status){
                                EasyLoading.showSuccess('Singing Successful...');
                                Newspaper().launch(context);
                              }
                              else{
                                EasyLoading.showError('Singing Filled');
                              }
                            }catch(e){
                              return EasyLoading.showError('Something wrong try again');
                            }
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('Login',style: TextStyle(fontFamily: 'Merriweather',fontSize: 18),),
                        )),
                    TextButton(
                        onPressed: (){},
                        child: const Text('Forgot Password',style: TextStyle(color: Colors.red,fontSize: 16),)),
                    
                  ],
                ),
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Need an Accounts?',style: TextStyle(color: Colors.grey[600],fontFamily: 'Merriweather',fontSize: 15),),
                    TextButton(onPressed: (){
                      SignupPage().launch(context);
                    }, child: const Text('Sign Up',style: TextStyle(fontFamily: 'Merriweather',color: Colors.red,fontSize: 17),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
