import 'package:flutter/material.dart';

class FeaturePage extends StatelessWidget {
  const FeaturePage({required this.image,required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(image),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),maxLines: 2,overflow: TextOverflow.ellipsis,),

        ),
        Divider(
          thickness: 1,
          color: Colors.black,
          height: 20,
        )
      ],
    );
  }
}
