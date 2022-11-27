import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prothom_alo/Restrict/Auth_repo.dart';
import 'package:prothom_alo/Screen/sing_in.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  TextEditingController namecontroller = TextEditingController();
  TextEditingController latnamecontroller=TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontoller=TextEditingController();
  TextEditingController phonecontroller=TextEditingController();
  TextEditingController confarmpasswordcontroller=TextEditingController();

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
                SizedBox(
                  height: 30,
                ),
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
                    textFieldType: TextFieldType.NAME,
                    controller: namecontroller,
                    decoration: InputDecoration(
                        hintText: 'First Name',
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
                SizedBox(height: 15,),
                SizedBox(
                  height: 50,
                  child: AppTextField(
                    textAlignVertical: TextAlignVertical.bottom,
                    textFieldType: TextFieldType.NAME,
                    controller: latnamecontroller,
                    decoration: InputDecoration(
                        hintText: 'Last Name',
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
                SizedBox(height: 15,),
                SizedBox(
                  height: 50,
                  child: AppTextField(
                    textAlignVertical: TextAlignVertical.bottom,
                    textFieldType: TextFieldType.PHONE,
                    controller: phonecontroller,
                    decoration: InputDecoration(
                        hintText: 'Phone',
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
                SizedBox(height: 15,),
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
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 50,
                  child: AppTextField(
                    textAlignVertical: TextAlignVertical.bottom,
                    textFieldType: TextFieldType.PASSWORD,
                    controller: confarmpasswordcontroller,
                    decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
                      ),
                      onPressed: () async{
                        if(namecontroller.text.isEmpty){
                          toast('Enter your FirstName');
                        }
                        else if(latnamecontroller.text.isEmpty){
                          toast('Enter your LastName');
                        }
                        else if(phonecontroller.text.isEmpty){
                          toast('Enter your Phone Number');
                        }
                        else if(emailcontroller.text.isEmpty){
                          toast('Enter your Email');
                        }
                        else if(passwordcontoller.text.isEmpty){
                          toast('Enter your Password');
                        }
                        else if(confarmpasswordcontroller.text.isEmpty){
                          toast('Enter your ConfarmPassword');
                        }
                        else if(passwordcontoller.text.length<6){
                          toast('Password at least 6 digit');
                        }
                        else if(confarmpasswordcontroller.text.length<6){
                          toast('Password at least 6 digit');
                        }
                        else{
                          try{
                            EasyLoading.show(status: 'Signing Up..');
                            var status= await AuthReop().SingUpwithEmail(namecontroller.text, latnamecontroller.text, emailcontroller.text, phonecontroller.text, passwordcontoller.text, confarmpasswordcontroller.text);
                            if(status){
                              EasyLoading.showSuccess('SingUp Succesful');
                            }
                            else{
                              EasyLoading.showError('SingUp Filled');
                            }
                          }catch(e){
                            EasyLoading.showError(e.toString());
                          }
                        }
                      },

                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Continue',style: TextStyle(fontFamily: 'Merriweather',fontSize: 18),),
                      )),
                ),
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an Accounts?',style: TextStyle(color: Colors.grey[600],fontFamily: 'Merriweather',fontSize: 15),),
                    TextButton(onPressed: (){
                      SingInPage().launch(context);
                    }, child: const Text('Login',style: TextStyle(fontFamily: 'Merriweather',color: Colors.red,fontSize: 17),))
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
