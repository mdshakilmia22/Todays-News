import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prothom_alo/Model/Sing_Up/SingUpModels.dart';
import 'package:prothom_alo/Restrict/Auth_repo.dart';
import 'package:prothom_alo/widget/Sub%20Widget/edit_profile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../Restrict/newConfig.dart';
import '../Screen/spalash.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  File? _image;

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        _image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Field to Pic Image: $e');
    }
  }
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/timezone.png', height: 25, width: 25),
        ),
        title: const Padding(
          padding: EdgeInsets.all(0),
          child: Text(
            'Todays Time',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontFamily: 'Merriweather'),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications,
              size: 35,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        opacity: 0.5,
                        image: NetworkImage(
                            'https://scontent.fdac136-1.fna.fbcdn.net/v/t39.30808-6/312798103_1487481241715806_9033796390300022862_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeHmtB1k6SJKTg4FMyeDQQE8E7H0DvQGjEoTsfQO9AaMSlqSe-f11k_E1SyukYmHR_hkDuYndYOEvX8G0g7PKxhw&_nc_ohc=YuDgxTLwcIoAX_Vr4nm&_nc_ht=scontent.fdac136-1.fna&oh=00_AfAvJvFsLJqPqsrZ9T4Pix7WVuHGgRP9Auxe4xxsTBOq6A&oe=6387F372'),
                      )),
                ),
                 Padding(
                  padding: const EdgeInsets.only(left: 30, top: 180),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.green,
                      backgroundImage:
                      NetworkImage(
                          'https://scontent.fdac136-1.fna.fbcdn.net/v/t1.6435-9/143607271_1076441342819800_4674677155533029637_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=174925&_nc_eui2=AeHHH7_Sv-gVjsWoNoKRNShK2rgPHYlGy77auA8diUbLvrwsbsZ4KsDaNdhXHvGYAij5HUg5bXLhh_cmF9rbYTr8&_nc_ohc=9hquq0IrtRMAX_6IomI&_nc_ht=scontent.fdac136-1.fna&oh=00_AfCKfwlwtmmGaAbboxgJDrdLizKyalWpPnULRjE1inMkpw&oe=63A91EFA'),

                    ),
                      InkWell(
                        onTap: ()=>getImage(ImageSource.gallery),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          child:  Icon(Icons.camera_alt,color: Colors.black,size: 25,),
                        ),
                      )
                  ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 220, left: 310),
                  child: InkWell(
                    onTap: ()=>getImage(ImageSource.gallery),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      child: const Icon(Icons.camera_alt,color: Colors.black,),
                    ),
                  ),
                ),

              ]),
              const SizedBox(
                height: 00,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Shakil Ahmed',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Merriweather'),
                    ),
                    Container(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            EditProfile().launch(context);
                          },
                          child: Row(
                            children: const [
                              Icon(Icons.edit,size: 25,),
                              SizedBox(width: 10,),
                              Text('Edit Profile'),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 8,
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  '965',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                Text(
                                  'Point',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  '1015',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                Text(
                                  'Followers',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  '368',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                Text(
                                  'Following',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    launchUrlString('https://mail.google.com/mail/u/0/#inbox');
                  });
                },
                child: ListTile(
                  leading: Image.network(
                    'https://cdn4.iconfinder.com/data/icons/social-media-logos-6/512/112-gmail_email_mail-512.png',
                    height: 30,
                    width: 30,
                  ),
                  title: const Text(
                    'mdshakilmia3245@gmail.com',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _makePhoneCall('01764972576');
                  });
                },
                child: ListTile(
                  leading: Image.network(
                    'https://i0.wp.com/www.tonation-nsn.gov/wp-content/uploads/2021/08/Phone-Icon.png',
                    height: 40,
                    width: 40,
                  ),
                  title: const Text(
                    '01764972576',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    launchUrlString('https://www.facebook.com/sakil.sirajul.5');
                  });
                },
                child: ListTile(
                  leading: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/2021_Facebook_icon.svg/2048px-2021_Facebook_icon.svg.png',
                    height: 40,
                    width: 40,
                  ),
                  title: const Text(
                    'Facebok',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    launchUrlString(
                        'https://www.linkedin.com/in/shakil-mia-667b28255/');
                  });
                },
                child: ListTile(
                  leading: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/174/174857.png',
                    height: 35,
                    width: 35,
                  ),
                  title: const Text(
                    'Linked in',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  String? token = prefs.getString('token');
                  var status = await NewsPaperClass().signOut(token ?? '');
                  
                 status ? prefs
                      .setString('token', '')
                      .then((value) => SpalashScreen().launch(context)) : EasyLoading.showError('Error');

                },
                child: const Text(
                  'Log Out',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
