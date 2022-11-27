import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prothom_alo/Restrict/Auth_repo.dart';
import 'package:prothom_alo/widget/profile.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Text('Update Profile',style: TextStyle(fontSize: 25,fontFamily: 'Merriweather',fontWeight: FontWeight.bold,color: Colors.teal),),
                  SizedBox(
                    height: 30,
                  ),

                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    controller: firstNameController,
                    decoration: InputDecoration(
                      hintText: 'Enter FirstName',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),

                  ),
                  SizedBox(height: 15,),
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    controller: lastNameController,
                    decoration: InputDecoration(
                        hintText: 'Enter LastName',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),

                  ),
                  SizedBox(height: 15,),
                  AppTextField(
                    textFieldType: TextFieldType.EMAIL,
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: 'Email Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),

                  ),
                  SizedBox(height: 15,),
                  AppTextField(
                    textFieldType: TextFieldType.PHONE,
                    controller: phoneController,
                    decoration: InputDecoration(
                        hintText: 'Enter Phone',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),

                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.deepOrange),
                        onPressed: ()async{
                          EasyLoading.show(status: 'Updating data');
                          var result= await AuthReop().updateProfile(firstNameController.text, lastNameController.text, emailController.text, phoneController.text);
                          if(result){
                            EasyLoading.showSuccess('Update Succesful');
                           ProfilePage().launch(context);
                          }
                          else{
                            EasyLoading.showError('Failled');
                          }
                        },
                        child: const Text('Update',style: TextStyle(fontSize: 25,color: Colors.white),)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
