import 'package:flutter/material.dart';

class FeaturePage extends StatelessWidget {
  const FeaturePage({required this.image,required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 230,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(0),
              bottomLeft: Radius.circular(0),
            ),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image))
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,fontFamily: 'Merriweather'),maxLines: 2,overflow: TextOverflow.ellipsis,),

        ),
        Divider(
          thickness: 1,
          color: Colors.black,
          height: 30,
        )
      ],
    );
  }
}
